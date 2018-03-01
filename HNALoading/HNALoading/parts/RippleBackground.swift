//
//  RippleBackGround.swift
//  HNALoading
//
//  Created by LiLi Kazine on 2018/3/1.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

class RippleBackground: UIView, CAAnimationDelegate {


    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(frame: CGRect, ripperColor:UIColor) {
        self.init(frame: frame)
        drawRipple(rippleColor: ripperColor)
    }
    
    func drawRipple(rippleColor:UIColor) {
        //ripple parameters
        let rippleDiameter = self.bounds.width>self.bounds.height ? self.bounds.width : self.bounds.height
        let rippleWidth:CGFloat = 12.0
        
        let layer = CAShapeLayer()
        layer.bounds = CGRect(x: 0, y: 0, width: rippleDiameter, height: rippleDiameter)
        layer.position.x = self.layer.position.x
        layer.position.y = self.layer.position.y
        layer.cornerRadius = rippleDiameter/2
        
        //animation parameters
        let duration:CFTimeInterval = 3
        let repeatCount = HUGE

        let group = CAAnimationGroup()
        group.duration = duration
        group.repeatCount = repeatCount
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        let value = NSValue.init(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1))
        scaleAnimation.fromValue = 0.7
        scaleAnimation.toValue = value
        scaleAnimation.duration = duration
        
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = duration
        opacityAnimation.values = [1.0, 0.5, 0]
        opacityAnimation.keyTimes = [0, 0.2, 1]
        
        group.animations = [scaleAnimation, opacityAnimation]
        
        //setup animation
        layer.borderWidth = rippleWidth
        layer.borderColor = rippleColor.cgColor
//        layer.backgroundColor = rippleColor.cgColor
        layer.opacity = 0
        layer.add(group, forKey: "ripple")
        group.delegate = self
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.addSublayer(layer)
        replicatorLayer.instanceCount = 6
        replicatorLayer.instanceDelay = 0.4
        
        self.layer.addSublayer(replicatorLayer)
        
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        print("ripple animation start")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("ripple animation stop")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
