import Foundation

class TaskStackManager {
    
    // todo, in progress, done
    var tasks: [TaskStack] {
        didSet {
//            NotificationCenter.default.post
        }
    }
    
    init(){
        tasks = [TaskStack(), TaskStack(), TaskStack()]
    }
    
    func count(_ status: Int) -> Int {
        return tasks[status].count
    }
    
    func index(_ status: Int, at index: Int) -> TaskCard {
        return tasks[status].index(at: index)
    }
    
    func append(_ status: Int, taskCard: TaskCard) {
        tasks[status].append(taskCard: taskCard)
    }
    
    func insert(_ status: Int, _ taskCard: TaskCard, at index: Int) {
        tasks[status].insert(taskCard, at: index)
    }
    
    func remove(_ status: Int, at index: Int) {
        let removedData = tasks[status].remove(at: index)
        NotificationCenter.default.post(name: .removeTask, object: self, userInfo: ["removedData":removedData])
        NetworkManager.updateData()
    }
    
    func arrayCount() -> [Int] {
        return [tasks[0].count, tasks[1].count, tasks[2].count]
    }
}
