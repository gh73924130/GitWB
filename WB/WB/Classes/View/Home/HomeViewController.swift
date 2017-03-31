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
        
        //注册通知,监听
        NotificationCenter.default.addObserver(self, selector: #selector(change), name: NSNotification.Name(rawValue: PopoverAnimatorWillShow), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(change), name: NSNotification.Name(rawValue: PopoverAnimatorWillDissmiss), object: nil)
    }
    
    @objc private func change() {
        //修改标题按钮的状态
        let titleBtn = navigationItem.titleView as! TitleButton
        titleBtn.isSelected = !titleBtn.isSelected
    }
    deinit {
        //移除通知
        NotificationCenter.default.removeObserver(self)
    }
    private func setupNav() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(leftBarButtonItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(rightBarButtonItemClick))
        //2 初始化标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("sina江南 ", for: .normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
    }
    @objc  private func titleBtnClick(sender: TitleButton) {
        //1 改变按钮的状态
//        sender.isSelected = !sender.isS elected
        //2 弹出来窗口
        let sb = UIStoryboard(name: "PopooverController", bundle:  nil)
        let vc = sb.instantiateInitialViewController()
        //2.1设置转场代理
//        vc?.transitioningDelegate = self
        vc?.transitioningDelegate = popoverAnimator
        //2.2设置转场模式
        vc?.modalPresentationStyle = .custom
        present(vc!, animated: true, completion: nil)
    }
    
    @objc private func leftBarButtonItemClick() {
        print(#function)
    }
    @objc private func rightBarButtonItemClick() {
        print(#function)
        
    }
    
    //懒加载
    //一定要定义一个属性来保存自定义转场的对象,否则会报错
    private lazy var popoverAnimator: PopoverAnimator = {
       let po = PopoverAnimator()
        po.presentFrame = CGRect(x: 100, y: 56, width: 200, height: 250)
        return po
    }()
  
}


