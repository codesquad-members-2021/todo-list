import Foundation

class TaskStackManager {
    
    // todo, in progress, done
    var tasks: [TaskStack] {
        didSet {
            //NotificationCenter.default.post(name: .updateTasksStatus, object: self)
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
        NotificationCenter.default.post(name: .requestRemoveTask, object: self, userInfo: ["removedData":removedData])
    }
    
    func arrayCount() -> [Int] {
        return [tasks[0].count, tasks[1].count, tasks[2].count]
    }
    
    func totalCount() -> Int {
        return arrayCount().reduce(0, +)
    }
    
    func move(_ status: Int, at index: Int){
            var movedData = tasks[status].remove(at: index)
        movedData.status = StatusValue.done
            tasks[StatusValue.done].append(taskCard: movedData)
        NotificationCenter.default.post(name: .requestMoveTask, object: self, userInfo: ["movedData": movedData])
        
    }
}
