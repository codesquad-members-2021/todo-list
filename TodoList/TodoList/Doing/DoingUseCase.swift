//
//  DoingUseCase.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import Foundation

class DoingUseCase {

    func loadDoingTask(completion: @escaping ([Task]) -> Void) {
        guard let url = EndPoint.url(with: .doing) else {
            return
        }
        
        URLSessionManager.request(with: url, completion: { result in
            switch result {
            case .success(let data):
                let tasks = Decoder.decode(from: data)
                completion(tasks ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func loadDoTask(completion: @escaping ([Task]) -> Void) {
        guard let url = EndPoint.url(with: .todo) else {
            return
        }
        
        URLSessionManager.request(with: url, completion: { result in
            switch result {
            case .success(let data):
                let tasks = Decoder.decode(from: data)
                completion(tasks ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func loadDoneTask(completion: @escaping ([Task]) -> Void) {
        guard let url = EndPoint.url(with: .done) else {
            return
        }
        
        URLSessionManager.request(with: url, completion: { result in
            switch result {
            case .success(let data):
                let tasks = Decoder.decode(from: data)
                completion(tasks ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
