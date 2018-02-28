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
                setupLetterAnimations(letter: view, delay: Double(idx) * 0.6)
                self.addSubview(view)
                views.append(view)
            }
            return views
        }()

    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 90, height: 30))
    }
    
    func setupLetterAnimations(letter:UIView, delay:Double) {
        UIView.animate(withDuration: 0.3, delay: delay, options: [.repeat, .autoreverse, .curveLinear], animations: {
            letter.layer.position.y -= 30
        }, completion: nil)
        if #available(iOS 10.0, *) {
            var flag:Bool = true
            let _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true, block: {_ in 
                if (flag){
                    self.pauseAnim(view: letter)
                }
                
                flag = false
            })
            
            let _ = Timer.scheduledTimer(withTimeInterval: 1.8, repeats: true, block: {_ in 
                if (!flag){
                    self.pauseAnim(view: letter)
                }
                flag = true
            })
        
        } else {
            // Fallback on earlier versions
        }        
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
