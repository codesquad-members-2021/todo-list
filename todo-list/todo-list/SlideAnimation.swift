//
//  SlideAnimation.swift
//  todo-list
//
//  Created by Song on 2021/04/08.
//

import UIKit

class SlideAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let isAppearing: Bool
    
    init(isAppearing: Bool) {
        self.isAppearing = isAppearing
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return isAppearing ? 0.5 : 1.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let presentedView = transitionContext.containerView
        
        if isAppearing {
            guard let presentingView = transitionContext.view(forKey: .to) else { return }
            showSlide(baseView: presentedView, slideView: presentingView, transitionContext)
        } else {
            dismissSlide(slideView: presentedView, transitionContext)
        }
    }
    
    private func showSlide(baseView: UIView, slideView: UIView, _ transitionContext: UIViewControllerContextTransitioning) {
        let baseViewSize = baseView.bounds.size
        let slideViewSize = slideView.bounds.size
        
        let originX = baseViewSize.width
        let slideViewFrame = CGRect(origin: CGPoint(x: originX, y: 0), size:slideViewSize)
       
        baseView.addSubview(slideView)
        slideView.frame = slideViewFrame

        let endX = slideViewSize.width * -1
        animatedMove(of: slideView, moveX: endX, transitionContext)
    }
    
    private func dismissSlide(slideView: UIView, _ transitionContext: UIViewControllerContextTransitioning) {
        let slideSize = slideView.bounds.size
        let endX = slideSize.width
        
        animatedMove(of: slideView, moveX: endX, transitionContext)
    }
    
    private func animatedMove(of view: UIView, moveX x: CGFloat,
                              _ transitionContext: UIViewControllerContextTransitioning) {
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0, usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0, options: .curveEaseIn) {
            view.transform = CGAffineTransform(translationX: x, y: 0)
        } completion: { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
