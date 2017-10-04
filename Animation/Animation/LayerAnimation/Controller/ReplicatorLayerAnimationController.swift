//
//  ReplicatorLayerAnimationController.swift
//  Animation
//
//  Created by HeJeffery on 2017/10/3.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class ReplicatorLayerAnimationController: UIViewController {
    
    private lazy var volumeView: VolumeView = {
        let volumeView = VolumeView()
        volumeView.frame = CGRect.zero
        volumeView.center = self.view.center
        return volumeView
    }()
    
    private lazy var progressView: ProgressView = {
        let progressView = ProgressView()
        progressView.frame = CGRect.zero
        progressView.center = CGPoint(x: self.volumeView.center.x, y: self.volumeView.center.y + 200)
        return progressView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ReplicatorLayer Animation"
        view.backgroundColor = UIColor.white
        view.addSubview(volumeView)
        view.addSubview(progressView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
