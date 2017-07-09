//
//  BPBlockView.swift
//  BPBlockActivityIndicator
//
//  Created by Naver on 2017. 7. 9..
//  Copyright © 2017년 BPBlockActivityIndicator. All rights reserved.
//

import UIKit

internal class BPBlockLayer: CALayer, CommonAnimation {
    
    init(frame: CGRect, color: UIColor) {
        super.init()
        self.frame = frame
        self.backgroundColor = color.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(duration: Double, position: CGPoint, beginTime: Double) {
        CATransaction.begin()
        let animation = positionAnimation(to: position, easing: .easeInOut, duration: duration)
        animation.beginTime = convertTime(CACurrentMediaTime(), from: nil) + beginTime
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        add(animation, forKey: nil)
        CATransaction.commit()
    }
    
    func stop() {
        removeAllAnimations()
    }
}
