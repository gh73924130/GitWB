//
//  PopoverPresentationController.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/26.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    //定义属性保存菜单的大小
    var presentFrame = CGRect.zero
    
//初始化方法,用于负责创建转场动画对象
    //presentedViewController 被展现的控制器
    //presentingViewController 发起的控制器
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    //即将布局转场子试图调用
    override func containerViewWillLayoutSubviews() {
        //修改弹出试图的大小
//        containerView 容器视图
//        presentedView 被展现的试图
        if presentFrame == CGRect.zero {
            
        presentedView?.frame = CGRect(x: 100, y: 50, width: 200, height:200)
            
        } else {
            presentedView?.frame = presentFrame 
        }
        // 在容器视图上面添加蒙版,插入展现视图下面
        // 容器视图和蒙版都在同一个容器上,后添加的会覆盖之前的
//        containerView?.addSubview(coverView)
        containerView?.insertSubview(coverView, at: 0)
        
    }
    //懒加载蒙版
    private lazy var coverView:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds
        //添加监听
        let tap = UITapGestureRecognizer(target: self, action: #selector(coverViewClick))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    @objc private func coverViewClick() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
