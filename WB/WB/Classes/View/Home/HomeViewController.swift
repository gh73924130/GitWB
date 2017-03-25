//
//  HomeViewController.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/24.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            visiter?.setupInfo(nil, title: "关注一些人，回这里看看有什么惊喜", isHome: true)
            return
        }
        //初始化导航条

        setupNav()
    }

    private func setupNav() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(leftBarButtonItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(rightBarButtonItemClick))
    }
    
    @objc private func leftBarButtonItemClick() {
        print(#function)
    }
    @objc private func rightBarButtonItemClick() {
        print(#function)

    }
}
