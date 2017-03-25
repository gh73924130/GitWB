//
//  VisiterView.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/25.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class VisiterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconView)
        addSubview(homeView)
        addSubview(messagelab)
        addSubview(loginBtn)
        addSubview(registerBtn)

    }
    
    required init?(coder aDecoder: NSCoder) {
        //如果通过sb或者xib创建,该方法就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
 
    //懒加载控件
    ///转盘
    private lazy var iconView: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return icon
    }()
    ///图标
    private lazy var homeView: UIImageView = {
        let home = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return home
    }()
    ///文子
    private lazy var messagelab: UILabel = {
        let lab = UILabel()
        lab.text = ":!!!@@@##$$$$$$$$fdgfhgjikjuhgfdsdbnikujyhtgfdsfgthyuuytreweqergthyuik"
        return lab
    }()
    ///登录
    private lazy var loginBtn: UIButton = {
        let login = UIButton()
        login.setTitle("登录", for: .normal)
        login.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: .normal)
        return login
    }()
    ///注册
    private lazy var registerBtn: UIButton = {
        let register = UIButton()
        register.setTitle("注册", for: .normal)
        register.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: .normal)
        return register
    }()
}
