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
    
    public func startCircling(parentView:UIView) {
        animView = LettersBouncingAnim()
        animView?.center = parentView.center
        parentView.addSubview(animView!)
    }
    
    public func stopCircling(){
        animView?.removeFromSuperview()
    }
    
}
