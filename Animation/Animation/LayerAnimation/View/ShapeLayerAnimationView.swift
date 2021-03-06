//
//  ShapeLayerAnimationView.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/30.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class ShapeLayerAnimationView: UIView {
    
    fileprivate let viewWH: CGFloat = 150
    
    private lazy var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 0, y: 0, width: viewWH, height: viewWH)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineDashPattern = [3, 6]
        let shapeWH: CGFloat = 65
        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: (viewWH * 0.5) - shapeWH,
                                                      y: (viewWH * 0.5) - shapeWH,
                                                      width: shapeWH * 2,
                                                      height: shapeWH * 2)).cgPath
        return shapeLayer
    }()
    
    private lazy var shapeAnimation: CABasicAnimation = {
        let shapeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        shapeAnimation.fromValue = 0
        shapeAnimation.toValue = 1
        shapeAnimation.duration = 2
        shapeAnimation.repeatCount = Float.infinity
        shapeAnimation.isRemovedOnCompletion = false
        return shapeAnimation
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
        backgroundColor = UIColor.clear
        layer.addSublayer(shapeLayer)
    }
    
    override func didMoveToWindow() {
        shapeLayer.add(shapeAnimation, forKey: nil)
    }

}
