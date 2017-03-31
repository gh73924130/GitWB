//
//  QRCodeViewConttoller.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/31.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class QRCodeViewConttoller: UIViewController {
    @IBOutlet weak var tabbar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置默认选中
        tabbar.selectedItem = tabbar.items?.first
    }

    @IBAction func closeBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
}
