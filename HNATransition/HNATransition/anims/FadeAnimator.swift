//
//  FadeAnimator.swift
//  HNATransition
//
//  Created by LiLi Kazine on 2018/3/2.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

class FadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.7

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration  
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        if let toView:UIView = transitionContext.view(forKey: UITransitionContextViewKey.to){
            containerView.addSubview(toView)
            
            toView.alpha = 0.0
            UIView.animate(withDuration: duration, animations: {
                toView.alpha = 1.0
            }, completion: {(finished) in
                transitionContext.completeTransition(finished)
            })
        } else {
            return
        }        
    }
}
