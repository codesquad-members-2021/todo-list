//
//  Router.swift
//  TodoList
//
//  Created by Ador on 2021/04/12.
//

import UIKit

class Router {
    static var shared = Router()
    
    func route(_ storyboard: UIStoryboard, title: String, contents: String) -> UIViewController? {
        guard let vc = storyboard.instantiateViewController(withIdentifier: "Add") as? AddViewController else {
            return nil
        }
        vc.status = .update
        vc.titleName = title
        vc.contents = contents
        vc.modalPresentationStyle = .overFullScreen
        return vc
    }
}
