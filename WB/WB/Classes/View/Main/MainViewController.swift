//
//  MainViewController.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/24.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createChildControllers()
    }
    
    private func createChildControllers(){
        //设置tabbar的tintcolor
        tabBar.tintColor = UIColor.orange
        
        addChildController(controller: HomeViewController(), image: "tabbar_home", title: "首页")
        addChildController(controller: MessageViewController(), image: "tabbar_message_center", title: "消息")
        addChildController(controller: DiscoverViewController(), image: "tabbar_discover", title: "发现")
        addChildController(controller: ProfileViewController(), image: "tabbar_profile", title: "我")
        
    }
    
    private func addChildController(controller: UIViewController,image:String,title:String) {
        //1.1 设置首页数据
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")
        controller.tabBarItem.title = title
        //
        let nav = UINavigationController()
        nav.addChildViewController(controller)
        
        addChildViewController(nav)
    }
}
