//
//  UIBarButtonItem+extension.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/26.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
   class func createBarButtonItem(imageName: String, target: AnyObject?,action:Selector) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.setImage(UIImage.init(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }
}
