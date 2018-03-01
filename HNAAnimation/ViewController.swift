//
//  ViewController.swift
//  HNAAnimation
//
//  Created by LiLi Kazine on 2018/2/26.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit
import HNALoading

class ViewController: UIViewController {

    private var circling:Bool = false
    private var bouncing:Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = UIImage(named: "far_cry_4_yeti")?.cgImage
        self.view.contentMode = .scaleAspectFill

    }
    
    @IBAction func circling(_ sender: UIButton) {
        circling ? HNALoading.getInstance.stopCircling() : HNALoading.getInstance.startCircling(parentView: self.view)
        circling = !circling
    }

    @IBAction func Bouncing(_ sender: UIButton) {
        bouncing ? HNALoading.getInstance.stopBouncing() : HNALoading.getInstance.startBouncing(parentView: self.view)
        bouncing = !bouncing
    }
    
}

