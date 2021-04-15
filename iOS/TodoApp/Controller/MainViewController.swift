//  Created by 김지선 on 2021/04/08.
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyTableView: UITableView!
    
    private var historyStack = HistoryStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.loginPost()
        registerHistoryCell()
        addObserver()
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
    
    private func registerHistoryCell() {
        historyTableView.register(UINib(nibName: CustomCell.history, bundle: nil), forCellReuseIdentifier: CustomCell.history)
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(drawHistoryCard), name: .addHistory, object: nil)
    }
    

}

//MARK: -Action
extension MainViewController {
    
    @IBAction func closeHistoryButtonTouched(_ sender: Any) {
        historyView.isHidden = true
    }
    
    @IBAction func showHistoryButtonTouched(_ sender: Any) {
        NetworkManager.fetchHistoryData()
        historyView.isHidden = false
    }
    @objc func drawHistoryCard(_ notification: Notification) {
        let historyCard = notification.userInfo?["historyCard"] as! HistoryCard
        historyStack.append(historyCard: historyCard)
        historyTableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyStack.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.history, for: indexPath) as! HistoryCell
        let index = historyStack.count - indexPath.row - 1
        let historyCard = historyStack.index(at: index)
        
        cell.historyLogLabel.text = historyCard.historyLog
        cell.userInfoLabel.text = historyCard.author
        cell.timeLabel.text = historyCard.time
        return cell
    }
    
    
}
