//
//  ShapeLayerAnimationView.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/30.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class ShapeLayerAnimationView: UIView {
    
    private lazy var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineDashPattern = [3, 6]
        let shapeWH: CGFloat = 65
        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: (150 * 0.5) - shapeWH,
                                                      y: (150 * 0.5) - shapeWH,
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
            newFrame.size.width = 150
            newFrame.size.height = 150
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
