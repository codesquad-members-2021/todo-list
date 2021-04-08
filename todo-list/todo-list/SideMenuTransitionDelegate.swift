//
//  CustomTransitionDelegate.swift
//  todo-list
//
//  Created by Song on 2021/04/08.
//

import UIKit

class SideMenuTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideAnimation(isAppearing: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideAnimation(isAppearing: false)
    }
}
