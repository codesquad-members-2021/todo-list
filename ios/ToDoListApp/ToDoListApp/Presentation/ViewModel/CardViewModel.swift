//
//  ToDoViewModel.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import Foundation
import Combine

class CardViewModel {
    private var cardUseCase: CardUseCasePort
    
    @Published var boards: [BoardManageable] = []
  
    var reloadCardList: AnyPublisher<Result<Void, Error>, Never> { reloadCardListSubject.eraseToAnyPublisher() }
    private var subscriptions = Set<AnyCancellable>()
    private var loadData: AnyPublisher<Void, Never> = PassthroughSubject<Void, Never>().eraseToAnyPublisher()
    private let reloadCardListSubject = PassthroughSubject<Result<Void, Error>, Never>()
        
    init(cardUseCase: CardUseCasePort) {
        self.cardUseCase = cardUseCase
    }
    
    convenience init() {
        let cardUseCase = CardUseCase()
        self.init(cardUseCase: cardUseCase)
    }
    
    private func configureBoard(type: CardFactory.Type, cards: AnyPublisher<[Card], Error>) {
        cards
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (result)
                    in switch result {
                    case .finished: print("finished")
                    case .failure(let error): print(error.localizedDescription) } },
                  receiveValue: { (cards) in
                    self.boards.append(type.self.makeBoard(cards: cards))
                  })
            
            .store(in: &subscriptions)
    }
    
    func requestBoard() {
        boards.removeAll()
        configureBoard(type: ToDo.self, cards: cardUseCase.get(state: .todo))
        configureBoard(type: Doing.self, cards: CardNetworkManager().getCards(state: .doing))
        configureBoard(type: Done.self, cards: CardNetworkManager().getCards(state: .done))
    }
    
    func addCard(columnId: Int) {
        cardUseCase.add(title: "나는 더해질 카드야", contents: "잘부탁해")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                    switch result {
                    case .finished: print("finished")
                    case .failure(let error): print(error.localizedDescription) } },
                  receiveValue: { cards in
                    self.boards[columnId].appendCard(cards.first!)
                    self.reloadCardListSubject.send(.success(()))
                  })
            .store(in: &subscriptions)
    }
    
    func attachViewEventListener(loadData: AnyPublisher<Void, Never>, columnId: Int) {
        
        self.loadData = loadData
        self.loadData
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] cards in
                    self?.addCard(columnId: columnId)
                  })
            .store(in: &subscriptions)
    }
}
