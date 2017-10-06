//
//  VolumeView.swift
//  Animation
//
//  Created by HeJeffery on 2017/10/3.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class VolumeView: UIView {
    
    fileprivate let viewH: CGFloat = 60
    fileprivate let viewW: CGFloat = 116
    
    private lazy var rectLayer: CALayer = {
        let rectLayer = CALayer()
        rectLayer.frame = CGRect(x: 0, y: 0, width: 20, height: viewH)
        // 调整anchor point
        rectLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        // 校正position
        rectLayer.position = CGPoint(x: 10, y: viewH)
        rectLayer.backgroundColor = UIColor.red.cgColor
        return rectLayer
    }()
    
    private lazy var replicatorLayer: CAReplicatorLayer = {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = self.bounds
        replicatorLayer.instanceCount = 5
        replicatorLayer.instanceDelay = 0.2
        // 为毛这里是24？每个小矩形的宽的20，总共是5个小矩形，每个小矩形间隔4，总的宽度是116。这里的24是相对于原始层的x轴的偏移量
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(24, 0, 0)
        replicatorLayer.addSublayer(self.rectLayer)
        self.rectLayer.add(animationGroup, forKey: nil)

        return replicatorLayer
    }()
    
    private lazy var animationGroup: CAAnimationGroup = {
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 0.5
        animationGroup.autoreverses = true
        animationGroup.repeatCount = Float.infinity
        animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animationGroup.fillMode = kCAFillModeBackwards
        animationGroup.isRemovedOnCompletion = false
    
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.y")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 0.2
        
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 0.1
        alphaAnimation.toValue = 1.0
        
        animationGroup.animations = [scaleAnimation, alphaAnimation]
        
        return animationGroup
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
            newFrame.size.width = viewW
            newFrame.size.height = viewH
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
