//
//  GradientLayerAnimationController.swift
//  Animation
//
//  Created by HeJeffery on 2017/9/29.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

/**
 渐变的动画
 */
class GradientLayerAnimationController: UIViewController {
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 60)
        gradientLayer.position = self.view.center
        gradientLayer.backgroundColor = UIColor.red.cgColor
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.25, 0.5, 0.75]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return gradientLayer
    }()
    
    private lazy var gradientAnimation: CABasicAnimation = {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.repeatCount = MAXFLOAT
        gradientAnimation.fromValue = [0, 0, 0.25]
        gradientAnimation.toValue = [0.75, 1, 1]
        gradientAnimation.duration = 5
        return gradientAnimation;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.layer.addSublayer(gradientLayer)
        gradientLayer.add(gradientAnimation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
