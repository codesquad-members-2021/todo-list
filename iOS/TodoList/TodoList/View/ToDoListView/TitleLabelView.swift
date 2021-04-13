//  Created by 김지선 on 2021/04/08.
import UIKit

class TitleLabelView: UIView {
    
    var taskCountLabel = UILabel()
    var addTaskCardButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMainView()
    }
    
    private func setupMainView() {
        backgroundColor = UIColor.systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
        setupSubViews()
        
        configureSubViews()
    }
    private func setupSubViews() {
        
        //TaskCountLabel Setting
        taskCountLabel.font = UIFont.boldSystemFont(ofSize: 14)
        taskCountLabel.textAlignment = .center
        taskCountLabel.text = "0"
        taskCountLabel.backgroundColor = UIColor.systemGray2
        addSubview(taskCountLabel)
        
        //AddTaskCardButton Setting
        addTaskCardButton.setImage(.add, for: .normal)
        addSubview(addTaskCardButton)
    }
    
    private func configureSubViews() {
        
        //TaskCountLabel Configure
        taskCountLabel.translatesAutoresizingMaskIntoConstraints = false
        taskCountLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        taskCountLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        taskCountLabel.layer.masksToBounds = true
        taskCountLabel.layer.cornerRadius = 10
        taskCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        
        //AddTaskCardButton Configure
        addTaskCardButton.translatesAutoresizingMaskIntoConstraints = false
        addTaskCardButton.widthAnchor.constraint(equalToConstant: 13.79).isActive = true
        addTaskCardButton.heightAnchor.constraint(equalToConstant: 13.79).isActive = true
        addTaskCardButton.trailingAnchor.constraint(equalTo: taskCountLabel.trailingAnchor, constant: 116).isActive = true
        addTaskCardButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    }
}
