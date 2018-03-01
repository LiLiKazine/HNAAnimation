//
//  LettersBouncingAnim.swift
//  HNALoading
//
//  Created by LiLi Kazine on 2018/2/28.
//  Copyright © 2018年 Hainan eKing Technology Co., Ltd. All rights reserved.
//

import UIKit

class LettersBouncingAnim: UIView {
    
    let bundle = Bundle(for: LettersBouncingAnim.self)


    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        let letters:[UIImage] = [UIImage(named: "letter_h", in: bundle, compatibleWith: nil)!,
                                 UIImage(named: "letter_n", in: bundle, compatibleWith: nil)!,
                                 UIImage(named: "letter_a", in: bundle, compatibleWith: nil)!]
        let views:[UIView] = {
            var views = [UIView]()
            for idx in 0..<letters.count {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                view.layer.contents = letters[idx].cgImage
                view.contentMode = .scaleAspectFit
                view.center.y = self.center.y
                view.center.x = self.center.x - 30.00 + CGFloat(idx) * 30.00
                setupLetterAnimations(letter: view, idx: idx)
                self.addSubview(view)
                views.append(view)
            }
            return views
        }()

    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 90, height: 30))
    }
    
    func setupLetterAnimations(letter:UIView, idx:Int) {
        //parameters
        let y = letter.layer.position.y
        let duration:CFTimeInterval = 0.6
        let beginTime = CACurrentMediaTime()
        let beginTimeOffsets = [0.1, 0.25, 0.4]
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)
        
        //animation
        let anim:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        anim.keyTimes = [0, 0.3, 0.6]
        anim.timingFunctions = [timingFunction, timingFunction]
        anim.values = [y, y-30, y]
        anim.duration = duration
        anim.repeatCount = HUGE
        anim.isRemovedOnCompletion = false
        anim.beginTime = beginTime + beginTimeOffsets[idx]
        
        letter.layer.add(anim, forKey: "bouncing")
    }
    
    
    func pauseAnim(view:UIView) {
        let pauseTime:CFTimeInterval = view.layer.convertTime(CACurrentMediaTime(), from: nil)
        view.layer.timeOffset = pauseTime
        view.layer.speed = 0
    }
    
    func resumeAnim(view:UIView){
        let pausedTime:CFTimeInterval = view.layer.timeOffset
        let timeSincePause:CFTimeInterval = CACurrentMediaTime() - pausedTime
        view.layer.timeOffset = 0
        view.layer.beginTime = timeSincePause
        view.layer.speed = 1
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
