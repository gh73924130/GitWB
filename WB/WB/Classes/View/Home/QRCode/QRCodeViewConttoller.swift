//
//  QRCodeViewConttoller.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/31.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class QRCodeViewConttoller: UIViewController {
    //底部工具条
    @IBOutlet weak var tabbar: UITabBar!
    /** 冲击波顶部约束 */
    @IBOutlet weak var scanLineView: UIImageView!
    @IBOutlet weak var scanLineCons: NSLayoutConstraint!
    //容器视图高度约束
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置默认选中
        tabbar.selectedItem = tabbar.items?.first
        //设置底部工具条的监听
        tabbar.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startAnimations()
    }

    func startAnimations(){
        view.layoutIfNeeded()
        // 1 设置冲击波底部和容器顶部对齐
        scanLineCons.constant = -containerHeightCons.constant
        //2 执行扫描动画
        UIView.animate(withDuration: 1.5, animations: { () ->() in
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.scanLineCons.constant = self.containerHeightCons.constant
            self.view.layoutIfNeeded()
            
        })
    }
    
    @IBAction func  closeBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
}
extension QRCodeViewConttoller: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         //设定tag
        //根据当前选中的按钮,重新设置二维码高度
        containerHeightCons.constant = item.tag == 1 ? 150:300
        view.layoutIfNeeded()
        
        //移除动画
         scanLineView.layer.removeAllAnimations()
        //重新开启动画
        startAnimations()
    }
}
