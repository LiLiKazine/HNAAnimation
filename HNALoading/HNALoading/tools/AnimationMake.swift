//
//  AnimationMake.swift
//  HNALoading
//
//  Created by LiLi Kazine on 2018/2/27.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

class AnimationMake {
    enum AnimType {
        case CABasicAnimation
        case CAKeyframeAnimation
    }
    enum KeyPath:String {
        case position = "position"
        case transform_rotation_z = "transform.rotation.z"
    }
    
    //        enum CreateAnimationError: String, Error {
    //            case ErrorReason = "animation is nil, make sure execute function make() first."
    //        }
    private init() {}
    static private let instance: AnimationMake = AnimationMake()
    
    private var anim:CAAnimation? = nil
    
    static func make(type:AnimType, keyPath:KeyPath)-> AnimationMake{
        switch type {
        case AnimType.CABasicAnimation:
            instance.anim = CABasicAnimation(keyPath:keyPath.rawValue)
        case AnimType.CAKeyframeAnimation:
            instance.anim = CAKeyframeAnimation(keyPath:keyPath.rawValue)
        }
        return instance
    }
    func duration(sec:Double) -> AnimationMake{
        anim?.duration = sec
        return AnimationMake.instance
    }
    func repeatCount(count:Float) -> AnimationMake {
        anim?.repeatCount = count
        return AnimationMake.instance
    }
    func get() -> CAAnimation {
        if let animation = anim {
            return animation
        }else{
            return CAAnimation.init()
            //                throw CreateAnimationError.ErrorReason
        }
    }
}
