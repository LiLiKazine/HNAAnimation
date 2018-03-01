//
//  HNALoading.swift
//  HNALoading
//
//  Created by LiLi Kazine on 2018/2/26.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

public class HNALoading: NSObject {
    
    private var animView:UIView?
        
    static private let shared:HNALoading = HNALoading()

    private override init() {}
    
    public class var getInstance:HNALoading{
        return shared
    }
    
    public func stopAnim(){
        animView?.removeFromSuperview()
    }
    
    public func startCircling(parentView:UIView) {
        animView = PlaneCirclingEarthAnim()
        animView?.center = parentView.center
        parentView.addSubview(animView!)
    }
    
    public func stopCircling(){
        self.stopAnim()
    }
    
    
    
    public func startBouncing(parentView:UIView){
        let rippleColor = UIColor.init(red: 0.9608, green: 0.898, blue: 0.749, alpha: 1)
        
        animView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        animView?.center = parentView.center
        
        let solidLayer = CAShapeLayer()
        solidLayer.bounds = CGRect(x: 0, y: 0, width: 90, height: 90)
        solidLayer.position = CGPoint(x: 50, y: 50)
        solidLayer.cornerRadius = 45
        solidLayer.backgroundColor = rippleColor.cgColor
        animView?.layer.addSublayer(solidLayer)
        
        let rippleAnim = RippleBackground(frame: CGRect(x: 0, y: 0, width: 100, height: 100), ripperColor: rippleColor)
        rippleAnim.center = CGPoint(x: 50, y: 50)
        animView?.addSubview(rippleAnim)

        let bouncingAnim = LettersBouncingAnim()
        bouncingAnim.center = CGPoint(x: 50, y: 35)
        animView?.addSubview(bouncingAnim)

        parentView.addSubview(animView!)
        
    }
    
    public func stopBouncing(){
        self.stopAnim()
    }
    
}
