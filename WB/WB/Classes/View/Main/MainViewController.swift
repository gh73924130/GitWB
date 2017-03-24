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
        
        addChildController(controllerName: "HomeViewController", image: "tabbar_home", title: "首页")
        addChildController(controllerName: "MessageViewController", image: "tabbar_message_center", title: "消息")
        addChildController(controllerName: "DiscoverViewController", image: "tabbar_discover", title: "发现")
        addChildController(controllerName: "ProfileViewController", image: "tabbar_profile", title: "我")
        
    }
    
    private func addChildController(controllerName: String,image:String,title:String) {
        //通过字符串创建类,涉及到命名空间
        let namespace = Bundle.main.namespace
        let cls: AnyClass? = NSClassFromString(namespace + "."+controllerName)
        //通过类创建对象
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
//        1.1 设置首页数据
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")
        vc.tabBarItem.title = title
        vc.title = title
        //
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        
        addChildViewController(nav)
    }
}
