//
//  ProgressView.swift
//  Animation
//
//  Created by HeJeffery on 2017/10/4.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    private lazy var animationGroup: CAAnimationGroup = {
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 1.0
        animationGroup.autoreverses = true
        animationGroup.repeatCount = Float.infinity
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.isRemovedOnCompletion = false
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.1
        scaleAnimation.toValue = 1.0
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.1
        opacityAnimation.toValue = 1.0
        
        animationGroup.animations = [scaleAnimation, opacityAnimation]
        
        return animationGroup
    }()
    
    private lazy var dotLayer: CALayer = {
        let dotLayer = CALayer()
        dotLayer.backgroundColor = UIColor.purple.cgColor
        let dotLayerWH: CGFloat = 8
        dotLayer.frame = CGRect(x: (self.bounds.width - dotLayerWH) * 0.5, y: 0, width: dotLayerWH, height: dotLayerWH)
        dotLayer.cornerRadius = dotLayerWH * 0.5
        dotLayer.opacity = 0
        dotLayer.add(self.animationGroup, forKey: nil)
        return dotLayer
    }()
    
    private lazy var replicatorLayer: CAReplicatorLayer = {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = self.bounds
        replicatorLayer.addSublayer(self.dotLayer)
        
        replicatorLayer.instanceCount = 20
        let angle: CGFloat = (.pi * 2) / 20.0
        // 绕z轴旋转一周
        replicatorLayer.instanceTransform = CATransform3DRotate(CATransform3DIdentity, angle, 0, 0, 1)
        replicatorLayer.instanceDelay = 0.1
        
        return replicatorLayer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override var frame: CGRect {
        set {
            var newFrame = newValue
            newFrame.size.width = 100
            newFrame.size.height = 100
            super.frame = newFrame
        }
        
        get {
            return super.frame
        }
    }

    func setup() {
        layer.addSublayer(replicatorLayer)
    }
}
