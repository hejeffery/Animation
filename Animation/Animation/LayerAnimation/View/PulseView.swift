//
//  PulseView.swift
//  Animation
//
//  Created by HeJeffery on 2017/10/6.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class PulseView: UIView {
    
    fileprivate let viewWH: CGFloat = 200
    
    private lazy var groupAnimation: CAAnimationGroup = {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 3
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeBackwards
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.7
        opacityAnimation.toValue = 0
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1.0
        
        groupAnimation.animations = [opacityAnimation, scaleAnimation]
        
        return groupAnimation;
    }()
    
    private lazy var circleLayer: CALayer = {
        let circleLayer = CALayer()
        circleLayer.frame = CGRect(x: 0, y: 0, width: viewWH, height: viewWH)
        circleLayer.cornerRadius = self.viewWH * 0.5
        circleLayer.backgroundColor = UIColor.blue.cgColor
        circleLayer.add(self.groupAnimation, forKey: nil)
        return circleLayer
    }()
    
    private lazy var replicatorLayer: CAReplicatorLayer = {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 0, y: 0, width: self.viewWH, height: self.viewWH)
        replicatorLayer.addSublayer(self.circleLayer)
        replicatorLayer.instanceCount = 3
        replicatorLayer.instanceDelay = 0.75
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
            newFrame.size.width = viewWH
            newFrame.size.height = viewWH
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
