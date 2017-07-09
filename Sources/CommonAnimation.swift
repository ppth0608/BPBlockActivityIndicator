//
//  CommonAnimation.swift
//  Pods
//
//  Created by Naver on 2017. 3. 30..
//
//

import UIKit

enum KeyframeAnimationType: String {
    
    case color = "backgroundColor"
    case position = "position"
    case rotate = "transform.rotation"
    case scale = "transform.scale"
    case opacity = "opacity"
    case fillColor = "fillColor"
}

enum EasingType: String {
    
    case linear
    case easeIn
    case easeOut
    case easeInOut
    case defaultEasing
    
    var rawValue: String {
        switch self {
        case .linear: return kCAMediaTimingFunctionLinear
        case .easeIn: return kCAMediaTimingFunctionEaseIn
        case .easeOut: return kCAMediaTimingFunctionEaseOut
        case .easeInOut: return kCAMediaTimingFunctionEaseInEaseOut
        case .defaultEasing: return kCAMediaTimingFunctionDefault
        }
    }
}

internal protocol CommonAnimation { }

internal extension CommonAnimation {
    
    func colorAnimation(to: CGColor, easing: EasingType = .linear, duration: Double) -> CABasicAnimation {
        return animation(to: to, keyPath: .color, easing: easing, duration: duration)
    }
    
    func positionAnimation(to: CGPoint, easing: EasingType = .linear, duration: Double) -> CABasicAnimation {
        return animation(to: to, keyPath: .position, easing: easing, duration: duration)
    }
    
    func rotateAnimation(to: CGFloat, easing: EasingType = .linear, duration: Double) -> CABasicAnimation {
        return animation(to: to, keyPath: .rotate, easing: easing, duration: duration)
    }
    
    func scaleAnimation(to: CGFloat, easing: EasingType = .linear, duration: Double) -> CABasicAnimation {
        return animation(to: to, keyPath: .scale, easing: easing, duration: duration)
    }
    
    func opacityAnimation(to: CGFloat, easing: EasingType = .linear, duration: Double) -> CABasicAnimation {
        return animation(to: to, keyPath: .opacity, easing: easing, duration: duration)
    }
    
    func fillColorAnimation(to: CGColor, easing: EasingType = .linear, duration: Double) -> CABasicAnimation {
        return animation(to: to, keyPath: .fillColor, easing: easing, duration: duration)
    }
    
    private func animation(to: Any, keyPath: KeyframeAnimationType, easing: EasingType, duration: Double) -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = keyPath.rawValue
        animation.toValue = to
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: easing.rawValue)
        return animation
    }
}
