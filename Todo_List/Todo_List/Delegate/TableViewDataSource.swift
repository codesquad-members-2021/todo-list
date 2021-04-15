//
//  TableViewDataSource.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/14.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var cards = Cards()
    
    init(with type : CardType){
        super.init()
        loadCards(with : type)
    }
    func loadCards(with type : CardType){
        DispatchQueue.main.async {
            // API완성되면 수정할 것
            CardAPIClient().loadAllCards(completion: { [weak self] result in
                switch result {
                case .success(let cards) : self?.cards = cards
                case .failure(let error) : print(error)
                }
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CardViewConstant.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as! CardCell
        let card = cards.items[indexPath.section]
        cell.title.text = card.title
        cell.content.text = card.content
        cell.writer.text = card.writer
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return cards.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        editingStyle == .delete
        cards.remove(at: indexPath.section)
        tableView.deleteSections([indexPath.section], with: .fade)
    }    
}
