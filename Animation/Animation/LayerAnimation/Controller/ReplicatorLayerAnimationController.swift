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
        volumeView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 200)
        return volumeView
    }()
    
    private lazy var progressView: ProgressView = {
        let progressView = ProgressView()
        progressView.frame = CGRect.zero
        progressView.center = self.view.center
        return progressView
    }()
    
    private lazy var pulseView: PulseView = {
        let pulseView = PulseView()
        pulseView.frame = CGRect.zero
        pulseView.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 200)
        return pulseView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ReplicatorLayer Animation"
        view.backgroundColor = UIColor.white
        view.addSubview(volumeView)
        view.addSubview(progressView)
        view.addSubview(pulseView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
