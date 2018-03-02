//
//  HNATransition.swift
//  HNATransition
//
//  Created by LiLi Kazine on 2018/3/2.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

public class HNATransition: NSObject {
    
    static private let shared:HNATransition = HNATransition()
    
    private override init() {}
    
    public class var getInstance:HNATransition{
        return shared
    }
    
    public func fade() -> UIViewControllerAnimatedTransitioning{
        return FadeAnimator()
    }
    
}
