//
//  GradientLayerAnimationView.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/30.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class GradientLayerAnimationView: UIView {
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.position = self.center
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.25, 0.5, 0.75]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return gradientLayer;
    }()
    
    private lazy var gradientAnimation: CABasicAnimation = {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.repeatCount = Float.infinity
        gradientAnimation.fromValue = [0, 0, 0.25]
        gradientAnimation.toValue = [0.75, 1, 1]
        gradientAnimation.duration = 3
        gradientAnimation.isRemovedOnCompletion = false
        return gradientAnimation;
    }()
    
    private lazy var maskLayer: CALayer = {    
        let textAttributes: [NSAttributedStringKey: AnyObject] = {
            let style = NSMutableParagraphStyle()
            style.alignment = .center
            return [
                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 25),
                NSAttributedStringKey.paragraphStyle: style
            ]
        }()

        let maskLayer = CALayer()
        let text = "Jeffery He"
        let image = UIGraphicsImageRenderer(size: self.bounds.size).image {
            _ in
            text.draw(in: self.bounds, withAttributes: textAttributes)
        }
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.frame = self.bounds.offsetBy(dx: self.bounds.size.width * 0.5, dy: 0)
        maskLayer.contents = image.cgImage
        return maskLayer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradientLayerX = -bounds.width * 0.5
        let gradientLayerY: CGFloat = 0.0
        let gradientLayerW = bounds.width * 2
        let gradientLayerH = bounds.height
        gradientLayer.frame = CGRect(x: gradientLayerX, y: gradientLayerY, width: gradientLayerW, height: gradientLayerH)
        gradientLayer.mask = maskLayer
    }
    
    func setup() {
        backgroundColor = UIColor.clear
        layer.addSublayer(gradientLayer)
        layer.masksToBounds = true
    }
    
    override func didMoveToWindow() {
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
}
