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
    
    private lazy var gradientView: GradientLayerAnimationView = {
        let gradientView = GradientLayerAnimationView()
        gradientView.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        gradientView.center = self.view.center
        return gradientView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(gradientView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
