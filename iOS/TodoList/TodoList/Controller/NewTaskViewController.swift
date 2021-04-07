//
//  NewTaskViewController.swift
//  TodoList
//
//  Created by 김지선 on 2021/04/07.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var NewTaskView: UIView!
    
    @IBOutlet weak var RegisterNewTaskButton: UIButton!
    @IBOutlet weak var CancelButton: UIButton!
    @IBAction func RegisterNewTaskActionButton(_ sender: Any) {
    }
    @IBAction func CancelActionButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNewTaskView()

        // Do any additional setup after loading the view.
    }
    
    func configureNewTaskView() {
        NewTaskView.layer.cornerRadius = 5
        RegisterNewTaskButton.layer.cornerRadius = 5
        CancelButton.layer.cornerRadius = 5
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
