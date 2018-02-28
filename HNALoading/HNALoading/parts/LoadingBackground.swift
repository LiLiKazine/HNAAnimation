//
//  HNALoadingBackground.swift
//  HNALoading
//
//  Created by LiLi Kazine on 2018/2/27.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

class LoadingBackground: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let rectPath = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(1, 1, 1, 1))
        let beierPath = UIBezierPath(roundedRect: rectPath, cornerRadius: 10)
        UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.8).setFill()
        beierPath.fill()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
