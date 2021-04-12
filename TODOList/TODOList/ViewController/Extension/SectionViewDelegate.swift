//
//  SectionViewDelegate.swift
//  TODOList
//
//  Created by Issac on 2021/04/12.
//

import UIKit

class SectionViewDelegate: NSObject {
    
}

extension SectionViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        footer.backgroundColor = .systemGray6
        return footer
    }
}
