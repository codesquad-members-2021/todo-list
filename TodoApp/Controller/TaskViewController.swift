//
//  TaskViewController.swift
//  TodoApp
//
//  Created by 김지선 on 2021/04/08.
//

import UIKit

class TaskViewController: UIViewController {
    
    var column: Int?
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
    }
    
    
    private func setupTitleLabel() {
        guard let column = column else { return }
        let titles: [Int: String] = [0: StatusInfo.toDo, 1: StatusInfo.inProgress, 2:StatusInfo.done]
        titleLabel.text = titles[column]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
