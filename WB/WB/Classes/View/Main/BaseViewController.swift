//
//  BaseViewController.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/25.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController,visiterViewDelegate {

    
    var visiter:VisiterView?
    //判断用户是否登录过
    var userLogin = true
    
    override func loadView() {
        
        userLogin ? super.loadView() : setupVisiterView()
    }
    
    private func setupVisiterView() {
    //初始化未登录界面
        let customView = VisiterView()
        customView.delegate = self
        view = customView

        visiter = customView
        //设置导航条未登录按钮
//        navigationController?.navigationBar.tintColor = UIColor.orange
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerBtnillClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginbtnWillClick))
    }
    //代理方法
    func loginbtnWillClick() {
        
    }
    func registerBtnillClick() {
        
    }
  }
