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
    
    @Published var boards: [Board] = []
  
    var reloadCardList: AnyPublisher<Result<Void, Error>, Never> { reloadCardListSubject.eraseToAnyPublisher() }
    private var subscriptions = Set<AnyCancellable>()
    private var loadData: AnyPublisher<Void, Never> = PassthroughSubject<Void, Never>().eraseToAnyPublisher()
    private let reloadCardListSubject = PassthroughSubject<Result<Void, Error>, Never>()
    
    init(cardUseCase: CardUseCasePort) {
        self.cardUseCase = cardUseCase
    }
    
    convenience init() {
        let cardUseCase = CardUseCase(card: Card())
        self.init(cardUseCase: cardUseCase)
    }
    
    private func configureBoard(title: String, cards: AnyPublisher<[Card], Error>) {
        cards
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (result)
                    
                    in switch result {
                    case .finished: print("finished")
                    case .failure(let error): print(error.localizedDescription) } },
                  receiveValue: { (cards) in
                    self.boards.append(Board(title: title, cards: cards))
                  })
            
            .store(in: &subscriptions)
    }
    
    func requestBoard() {
        boards.removeAll()
        configureBoard(title: "해야할 일", cards: cardUseCase.get(state: .todo))
        configureBoard(title: "하고 있는 일", cards: CardNetworkManager().getCards(state: .doing))
        configureBoard(title: "완료한 일", cards: CardNetworkManager().getCards(state: .done))
    }
    
    func addCard(state: State) {
        cardUseCase.add(title: "나는 더해질 카드야", contents: "잘부탁해")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                    switch result {
                    case .finished: print("finished")
                    case .failure(let error): print(error.localizedDescription) } },
                  receiveValue: { cards in
                    self.boards[state.rawValue-1].cards.append(contentsOf: cards)
                  })
            .store(in: &subscriptions)
    }
    
    func attachViewEventListener(loadData: AnyPublisher<Void, Never>, cardState: State) {
        
        self.loadData = loadData
        self.loadData
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] cards in
                    print("뷰모델입니다. \(cards)")
                    self?.addCard(state: cardState)
                    self?.reloadCardListSubject.send(.success(()))
                  })
            .store(in: &subscriptions)
    }
}
