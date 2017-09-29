//
//  LayerAnimationController.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/7.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

/**
 Layer的动画，Core Animation
 */
class LayerAnimationController: UIViewController {
    
    // MARK: - Init
    fileprivate lazy var datas: [Item] = {
        var datas: [Item] = []
        let path = Bundle.main.path(forResource: "LayerAnimation.plist", ofType: nil)
        guard let filePath = path else {
            return []
        }
        var items = NSArray(contentsOfFile: filePath)
        guard let itemDatas = items else {
            return []
        }
        
        for dict in itemDatas {
            let item = Item(dict: dict as! Dictionary<String, String>)
            datas.append(item)
        }
        return datas
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.rowHeight = 60.0
        return tableView
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Layer Animation"
        view.backgroundColor = UIColor.white        
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource
extension LayerAnimationController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainTableViewCell.mainTableViewCell(tableView)
        cell.item = datas[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension LayerAnimationController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = datas[indexPath.row]
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        let className = appName + "." + item.controller!
        
        if item.controller! == "AutoLayoutAnimationController" {
            let autoLayoutAnimationController = AutoLayoutAnimationController(nibName: "AutoLayoutAnimationController", bundle: nil)
            self.navigationController?.pushViewController(autoLayoutAnimationController, animated: true)
            
        } else {
            let viewControllerClass = NSClassFromString(className) as! UIViewController.Type
            self.navigationController?.pushViewController(viewControllerClass.init(), animated: true)
        }
    }
}

