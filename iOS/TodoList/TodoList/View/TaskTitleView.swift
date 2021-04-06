//import UIKit
//
//class TaskTitleView: UIView {
//    
//    private var titleLabel = UILabel()
//    private var taskCountLabel = UILabel()
//    private var addTaskButton = UIButton(type: .system)
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureTitleView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        configureTitleView()
//    }
//    
//    
//    private func setUpTitleView() {
//        titleLabel.frame = CGRect(x: 0, y: 0, width: 71, height: 26)
//        taskCountLabel.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
//        addTaskButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        //
//        addSubview(titleLabel)
//        addSubview(taskCountLabel)
//        addSubview(addTaskButton)
//    }
//    private func configureTitleView() {
//        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
//        taskCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 200).isActive = true
//        addTaskButton.leadingAnchor.constraint(equalTo: taskCountLabel.trailingAnchor, constant: 116).isActive = true
//        titleLabel.text = "TEST"
//        taskCountLabel.text = "2"
//        taskCountLabel.textAlignment = .center
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        taskCountLabel.font = UIFont.boldSystemFont(ofSize: 14)
//        taskCountLabel.layer.masksToBounds = true
//        taskCountLabel.layer.cornerRadius = taskCountLabel.frame.width/2
//        taskCountLabel.backgroundColor = UIColor.systemGray4
//        addTaskButton.setImage(.add, for: .normal)
//        
//    }
//}
