//  Created by 김지선 on 2021/04/08.
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StatusInfo.toDo: if let taskViewController = segue.destination as? TaskViewController {
            taskViewController.status = ColumnInfo.first
        }
        case StatusInfo.inProgress: if let taskViewController = segue.destination as? TaskViewController {
            taskViewController.status = ColumnInfo.second
        }
        case StatusInfo.done: if let taskViewController = segue.destination as? TaskViewController {
            taskViewController.status = ColumnInfo.third
        }
        default:
            break
        }
    }
}

