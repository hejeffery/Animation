//
//  ShapeLayerAnimationController.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/30.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

/**
 CAShapeLayer的动画
 */
class ShapeLayerAnimationController: UIViewController {
    
    private lazy var shapeLayerAnimationView: ShapeLayerAnimationView = {
        let shapeLayerAnimationView = ShapeLayerAnimationView()
        shapeLayerAnimationView.frame = CGRect.zero
        shapeLayerAnimationView.center = self.view.center
        return shapeLayerAnimationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ShapeLayer Animation"
        view.backgroundColor = UIColor.white
        view.addSubview(shapeLayerAnimationView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
