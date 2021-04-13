//  Created by 김지선 on 2021/04/08.
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.loginPost()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StatusInfo.toDo: if let taskViewController = segue.destination as? TaskViewController {
            taskViewController.column = StatusValue.toDo
        }
        case StatusInfo.inProgress: if let taskViewController = segue.destination as? TaskViewController {
            taskViewController.column = StatusValue.inProgress
        }
        case StatusInfo.done: if let taskViewController = segue.destination as? TaskViewController {
            taskViewController.column = StatusValue.done
        }
        default:
            break
        }
    }
}

