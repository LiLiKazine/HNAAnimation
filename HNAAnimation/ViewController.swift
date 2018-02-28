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

    private var animOn:Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = UIImage(named: "far_cry_4_yeti")?.cgImage
        self.view.contentMode = .scaleAspectFill
        let stopBtn = UIButton(frame: CGRect(x: self.view.center.x-40, y: 600, width: 80, height: 30))
        self.view.addSubview(stopBtn)
        stopBtn.addTarget(self, action: #selector(stop), for: .touchUpInside)
        stopBtn.setTitle("STOP", for: .normal)
    }
    
    @objc func stop(){
        animOn ? HNALoading.getInstance.stopCircling() : HNALoading.getInstance.startCircling(parentView: self.view)
        animOn = !animOn
    }

}

