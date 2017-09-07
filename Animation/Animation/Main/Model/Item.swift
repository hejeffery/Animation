//
//  Item.swift
//  Animation
//
//  Created by jhe.jeffery on 2017/9/7.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import Foundation

struct Item {
    var title: String?
    var controller: String?
    
    init(dict: Dictionary<String, String>) {
        title = dict["title"]
        controller = dict["controller"]
    }
}
