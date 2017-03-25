 //
//  ProfileViewController.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/24.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            visiter?.setupInfo("visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人", isHome: false)
        }
    }

}
