//
//  TopSection.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/06.
//

import UIKit

class TopSectionView : UIView{
    let title : TitleLabel
    let historyButton : HistoryButton
    
    override init(frame : CGRect) {
        title = TitleLabel.init(frame: CGRect(x: 48, y: 13, width: 171, height: 46))
        historyButton = HistoryButton.init(frame: CGRect(x: 1125, y: 31, width: 17, height: 11))
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        title = TitleLabel.init(frame: CGRect(x: 48, y: 13, width: 171, height: 46))
        historyButton = HistoryButton.init(frame: CGRect(x: 1125, y: 31, width: 17, height: 11))
        super.init(coder: coder)
        initSubViews()
    }
}

extension TopSectionView {
    private func initSubViews(){
        setTitleAutoLayout()
        sethistoryButtonAutolayout()
    }
    
    private func setTitleAutoLayout(){
        self.addSubview(title)
        self.translatesAutoresizingMaskIntoConstraints = false
        //self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //self.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 975).isActive = true
        //self.topAnchor.constraint(equalTo: self.topAnchor, constant: 13).isActive = true
        //self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 13).isActive = true
    }
    
    private func sethistoryButtonAutolayout(){
        self.addSubview(historyButton)
    }
}
