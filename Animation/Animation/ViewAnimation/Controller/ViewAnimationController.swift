//
//  ViewAnimationController.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/7.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

/**
 最基本的UIView的动画
 */
class ViewAnimationController: UIViewController {
    
    private lazy var purpleView: UIView = {
        let purpleView = UIView()
        purpleView.frame = CGRect(x: 0, y: 100, width: 60, height: 60)
        purpleView.backgroundColor = UIColor.purple
        return purpleView
    }()
    
    private lazy var moveButton: UIButton = {
        let moveButton = self.createButton("移动动画")
        moveButton.frame = CGRect(x: 10, y: 10, width: 80, height: 40)
        return moveButton
    }()
    
    private lazy var colorButton: UIButton = {
        let colorButton = self.createButton("颜色动画")
        colorButton.frame = CGRect(x: self.moveButton.frame.maxX + 10, y: 10, width: 80, height: 40)
        return colorButton
    }()
    
    private lazy var transformButton: UIButton = {
        let transformButton = self.createButton("transform")
        transformButton.frame = CGRect(x: self.colorButton.frame.maxX + 10, y: 10, width: 80, height: 40)
        return transformButton
    }()
    
    private lazy var springButton: UIButton = {
        let springButton = self.createButton("spring")
        springButton.frame = CGRect(x: self.transformButton.frame.maxX + 10, y: 10, width: 80, height: 40)
        return springButton
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        
        view.addSubview(moveButton)
        view.addSubview(colorButton)
        view.addSubview(transformButton)
        view.addSubview(springButton)
        view.addSubview(purpleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action
    @objc private func buttonAction(button: UIButton) {
        if button == self.moveButton {
            moveAnimation()

        } else if button == self.colorButton {
            colorAnimation()

        } else if button == self.transformButton {
            transformAnimation()

        } else {
            springAnimation()

        }
    }
    
    private func moveAnimation() {
//        // 第一种
//        UIView.animate(withDuration: 2, animations: {
//            self.purpleView.center = CGPoint(x: 300, y: 255)
//        })
        
//        // 第二种
//        UIView.animate(withDuration: 2, animations: {
//            self.purpleView.center = CGPoint(x: 200, y: 255)
//            
//        }, completion: { completed in
//            if completed {
//                print("动画完成")
//            }
//        })
        
        // 第三种
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: {
            self.purpleView.center = CGPoint(x: 200, y: 255)
            
        }, completion: nil)
    }
    
    private func colorAnimation() {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn], animations: {
            self.purpleView.backgroundColor = UIColor.orange

        }, completion: nil)
    }
    
    private func transformAnimation() {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut], animations: {
            self.purpleView.transform = CGAffineTransform(translationX: 100, y: 133)
            
        }, completion: nil)
    }
    
    private func springAnimation() {
        // Damping：劲度系数，范围是0.0～1.0。越接近0.0，效果越明显；越接近1.0，越没效果
        // Velocity：控制的初始速度，范围也是0.0~1.0。越接近0.0，初始速度越大；越接近1.0，初始速度越小
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: [], animations: {
            self.purpleView.center = CGPoint(x: 200, y: 300)
        }, completion: nil)
    }
    
    // MARK: - Create Button
    private func createButton(_ title: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.yellow
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 3.0
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonAction(button:)), for: .touchUpInside)
        return button
    }

}
