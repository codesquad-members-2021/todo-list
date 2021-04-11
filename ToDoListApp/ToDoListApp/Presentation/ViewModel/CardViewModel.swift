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
    private var cancellables: [AnyCancellable] = []
    @Published var boards: [Board] = []
    
    private var subscriptions = Set<AnyCancellable>()
    var reloadPlaceList: AnyPublisher<Result<Void, Error>, Never> {
        reloadPlaceListSubject.eraseToAnyPublisher()
    }
    private var loadData: AnyPublisher<Void, Never> = PassthroughSubject<Void, Never>().eraseToAnyPublisher()
    private let reloadPlaceListSubject = PassthroughSubject<Result<Void, Error>, Never>()
    
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
    
    public func requestBoard() {
        boards.removeAll()
        configureBoard(title: "해야할 일", cards: cardUseCase.get(state: .todo))
        configureBoard(title: "하고 있는 일", cards: CardNetworkManager().getCards(state: .doing))
        configureBoard(title: "완료한 일", cards: CardNetworkManager().getCards(state: .done))
    }
    
    func attachViewEventListener(loadData: AnyPublisher<Void, Never>) {
        
        self.loadData = loadData
        self.loadData
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] places in
                    print("뷰모델입니다.")
                    
                    self?.reloadPlaceListSubject.send(.success(()))
                  })
            .store(in: &subscriptions)
    }
}
