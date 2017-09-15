//
//  AutoLayoutAnimationController.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/13.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

/**
 AutoLayout的动画
 */
class AutoLayoutAnimationController: UIViewController {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AutoLayout Animation"
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.widthConstraint.constant = 200
        self.heightConstraint.constant = 200
        self.topConstraint.constant = 200
        self.leftConstraint.constant = 200

        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
            
            // 必须要掉用layoutIfNeeded
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}
