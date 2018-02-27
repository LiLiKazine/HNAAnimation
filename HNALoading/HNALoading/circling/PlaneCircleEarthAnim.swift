//
//  PlaneCircleEarthAnim.swift
//  HNALoading
//
//  Created by LiLi Kazine on 2018/2/26.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

class PlaneCircleEarthAnim: UIView, CAAnimationDelegate {
    
    let bundle = Bundle(for: PlaneCircleEarthAnim.self)
    
    var planeLayer:CALayer? = nil
    var earthLayer:CALayer? = nil
    
    var planeAnim:CAKeyframeAnimation? = nil
    var earthAnim:CAKeyframeAnimation? = nil
    
    var animLayers:[CALayer]? = nil
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        let background: UIView = HNALoadingBackground(frame: frame)
        self.center = background.center
        self.addSubview(background)
        planeCircling()
        earthOrbiting()
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        self.backgroundColor = UIColor.clear
    }
    
    func planeCircling(){

        //plane circling animation
        let circlingAnim:CAKeyframeAnimation = AnimationMake
            .make(type: .CAKeyframeAnimation, keyPath: .position)
            .duration(sec: 1.2).repeatCount(count: HUGE)
            .get() as! CAKeyframeAnimation
        circlingAnim.delegate = self
        circlingAnim.calculationMode = kCAAnimationPaced

        
        //plane circling path
        let circlingPath = UIBezierPath(ovalIn: CGRect(x: 15, y: 15, width: 50, height: 50))
        circlingAnim.path = circlingPath.cgPath
        
        //plane angle reposition
        let angleAnim:CABasicAnimation = AnimationMake.make(type: .CABasicAnimation, keyPath: .transform_rotation_z).duration(sec: 1.2).repeatCount(count: HUGE).get() as! CABasicAnimation
        angleAnim.fromValue = 1/2 * Double.pi
        angleAnim.toValue = 5/2 * Double.pi

        //plane
        guard let planeImg: UIImage = UIImage(named: "plane", in: bundle, compatibleWith: nil) else { return  }
        let planeView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let layer:CALayer = planeView.layer
        layer.contents = planeImg.cgImage
        planeView.contentMode = .scaleAspectFit
        planeView.center = self.center
        self.addSubview(planeView)
        layer.add(circlingAnim, forKey: "circling")
        layer.add(angleAnim, forKey: "angle")
        animLayers?.append(layer)
    }
    
    func earthOrbiting() {
        //earth orbiting animation
        let orbitingAnim:CABasicAnimation = AnimationMake.make(type: .CABasicAnimation, keyPath: .transform_rotation_z).duration(sec: 3).repeatCount(count: HUGE).get() as! CABasicAnimation
        orbitingAnim.fromValue = 0
        orbitingAnim.toValue = 2 * Double.pi
        
        //earth
        guard let earthImg: UIImage = UIImage(named: "earth", in: bundle, compatibleWith: nil) else { return  }
        let earthView: UIView = UIView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        let layer:CALayer = earthView.layer
        layer.contents = earthImg.cgImage
        earthView.contentMode = .scaleAspectFit
        earthView.center = self.center
        self.addSubview(earthView)
        layer.add(orbitingAnim, forKey: "orbiting")
        animLayers?.append(layer)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        print("start")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("anim stop")
    }
}
