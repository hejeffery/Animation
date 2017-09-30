//
//  MainTableViewCell.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/7.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // subviews
    private var titleLabel: UILabel!
    
    // model
    var item: Item? {
        didSet {
            guard let content = item?.title else {
                titleLabel.text = "----"
                return
            }
            titleLabel.text = content
        }
    }
    
    // init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let marginX: CGFloat = 15.0
        let titleLabelX = marginX
        let titleLabelY: CGFloat = 0.0
        let titleLabelW = bounds.width - marginX * 2
        let titleLabelH = bounds.height
        titleLabel.frame = CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelW, height: titleLabelH)
    }
    
    // setup subviews
    private func setupViews() {
        let titleLabel = UILabel.init()
        titleLabel.frame = CGRect.zero
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
    }
}

// MARK: - extension Cell的类方法
extension MainTableViewCell {
    // 类方法
    class func mainTableViewCell(_ tableView: UITableView) -> MainTableViewCell {
        let cellID = "MainTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = MainTableViewCell.init(style: .default, reuseIdentifier: cellID)
        }
        return cell as! MainTableViewCell
    }
}
