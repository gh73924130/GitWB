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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //添加+ 按钮
        addComposeBtn()
    }
    
    private func addComposeBtn() {

        //1 添加到tabbar上
        tabBar.addSubview(composeBtn)
        
        //2 设置 + 按钮的位置
        let width = UIScreen.main.bounds.size.width / CGFloat((viewControllers?.count)!)
        
        let rect = CGRect(x: 2 * width, y: 0, width: width, height: 49)
        
        composeBtn.frame = rect
    }
    
    private lazy var composeBtn = { () -> UIButton in 
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: .normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        
        return btn
        
    }()
    
     func composeBtnClick() {
        print("sd")
    }
    
    private func createChildControllers(){
        //设置tabbar的tintcolor
        tabBar.tintColor = UIColor.orange
        
        //获取json数据
        let path = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil)
        //通过文件路径创建NSData
        guard let jsonPath = path,
            let jsonData = NSData(contentsOfFile: jsonPath) else {
                return
        }
        //序列化json数据-> Array
        do {
            let dictArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers)
            //遍历字典
            for dict in dictArray as! [String: String] {
                print(dict)
            }
        
            
            //FIXME:JSON序列化出错,暂时没有处理
        }catch{
            //如果没有就用原始的
            addChildController(controllerName: "HomeViewController", image: "tabbar_home", title: "首页")
            addChildController(controllerName: "MessageViewController", image: "tabbar_message_center", title: "消息")
            addChildController(controllerName: "ComposeViewController", image: "", title: "")
            addChildController(controllerName: "DiscoverViewController", image: "tabbar_discover", title: "发现")
            addChildController(controllerName: "ProfileViewController", image: "tabbar_profile", title: "我")
        }
    
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
