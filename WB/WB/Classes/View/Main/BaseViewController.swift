//
//  BaseViewController.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/25.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    //判断用户是否登录过
    var userLogin = false
    
    override func loadView() {
        
        userLogin ? super.loadView() : setupVisiterView()
    }
    
    private func setupVisiterView() {
        
        let customView = VisiterView()
        
        view = customView

    }
  }
