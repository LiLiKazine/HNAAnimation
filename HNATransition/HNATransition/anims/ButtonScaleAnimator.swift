//
//  ButtonScaleAnimator.swift
//  HNATransition
//
//  Created by LiLi Kazine on 2018/3/7.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

class ButtonScaleAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    open weak var animatedView: UIView?
    open var startFrame = CGRect()
    open var startBackgroundColor: UIColor?
    open var isReverse = false
    open var transitionDuration: TimeInterval = 0.5
    
    convenience init(animatedView: UIView) {
        self.init()
        self.animatedView = animatedView
    }
    
    //UIViewControllerAnimatedTransitioning
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transitionDuration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let animatedView = animatedView, let superview = animatedView.superview {
            self.startFrame = superview.convert(animatedView.frame, to: nil)
            self.startBackgroundColor = animatedView.backgroundColor
        }
        
        //Use if the transitionContext.containerView is not fullscreen
        let startFrame = transitionContext.containerView.superview?.convert(self.startFrame, to: transitionContext.containerView) ?? self.startFrame
        
        let animatedViewForTransition = UIView(frame: startFrame)
        transitionContext.containerView.addSubview(animatedViewForTransition)
        
        animatedViewForTransition.clipsToBounds = true
        animatedViewForTransition.layer.cornerRadius = animatedViewForTransition.frame.height / 2.0
        animatedViewForTransition.backgroundColor = self.startBackgroundColor
        
        let presentedViewController: UIViewController
        
        if !self.isReverse {
            presentedViewController = transitionContext.viewController(forKey: .to)!
            presentedViewController.view.layer.opacity = 0
        } else {
            presentedViewController = transitionContext.viewController(forKey: .from)!
        }
        
        presentedViewController.view.frame = transitionContext.containerView.bounds
        transitionContext.containerView.addSubview(presentedViewController.view)
        
        let size = max(transitionContext.containerView.bounds.height, transitionContext.containerView.bounds.width) * 1.2
        let scaleFactor = size / animatedViewForTransition.bounds.width
        let finalTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        
        if !self.isReverse {
            UIView.transition(with: animatedViewForTransition, duration: self.transitionDuration(using: transitionContext) * 0.7, options: [], animations: { 
                animatedViewForTransition.transform = finalTransform
                animatedViewForTransition.center = transitionContext.containerView.center
                animatedViewForTransition.backgroundColor = presentedViewController.view.backgroundColor
                }, completion: {(_) in
            })
        }
    }
    
}
