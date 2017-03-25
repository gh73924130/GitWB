//
//  VisiterView.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/25.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit
//定义协议
protocol visiterViewDelegate: NSObjectProtocol {
     //登录
    func loginbtnWillClick()
    //注册
    func registerBtnillClick()
}
    
class VisiterView: UIView {
    
    //定义代理属性,一定要加weak
   weak var delegate:visiterViewDelegate?
    
    func setupInfo(_ imageName: String?, title: String,isHome:Bool) {
        
        messagelab.text = title
        //如果图片名称是nil,说明是首页,直接返回
        guard let imgName = imageName else {
            //播放动画
            startAnimation()
            return
        }
        homeView.image = UIImage(named: imgName)
        //隐藏小房子
        iconView.isHidden = !isHome
//        sendSubview(toBack: maskIconView)
    }
    
 //设置动画
    private func startAnimation() {
        let ain = CABasicAnimation(keyPath: "transform.rotation")
        ain.toValue = 2 * M_PI
        ain.repeatCount = MAXFLOAT
        ain.duration = 20
        // 用在不断重复的动画上，当动画绑定的图层对应的视图被销毁，动画会自动被销毁

        ain.isRemovedOnCompletion = false
        //把动画添加到图层
        iconView.layer.add(ain, forKey: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(iconView)
        addSubview(homeView)
        addSubview(messagelab)
        addSubview(loginBtn)
        addSubview(registerBtn)
//        addSubview(maskIconView)
        //Autolayout
        setupFrame()

    }

    func loginbtnClick() {
        delegate?.loginbtnWillClick()
    }
    func registerBtnClick() {
        delegate?.registerBtnillClick()
    }
    
    private func setupFrame() {

        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        
        addConstraint(NSLayoutConstraint(item: homeView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))

        addConstraint(NSLayoutConstraint(item: messagelab, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messagelab, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: messagelab, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(NSLayoutConstraint(item: messagelab, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
//
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .left, relatedBy: .equal, toItem: messagelab, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: messagelab, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .top, relatedBy: .equal, toItem: loginBtn, attribute: .top, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .right, relatedBy: .equal, toItem: messagelab, attribute: .right, multiplier: 1.0, constant: 0))
        //遮罩,图层
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mask]-0-|", options: [], metrics: nil, views: ["mask": maskIconView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mask]-(btnHeight)-[regButton]", options: [], metrics: ["btnHeight": -36], views: ["mask": maskIconView, "regButton": registerBtn]))
//        backgroundColor = UIColor(white: 237.0/255.0, alpha: 1.0)
        
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
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: 12)
        lab.text = "关注一些人,回这里看看有什么惊喜"
        lab.textAlignment = NSTextAlignment.center
        return lab
    }()
    ///登录
    private lazy var loginBtn: UIButton = {
        let login = UIButton()
        login.setTitle("登录", for: .normal)
        login.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        login.setTitleColor(UIColor.orange, for: .normal)
        login.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: .normal)
        login.addTarget(self, action: #selector(loginbtnClick), for: .touchUpInside)
        return login
    }()
    ///注册
    private lazy var registerBtn: UIButton = {
        let register = UIButton()
        register.setTitle("注册", for: .normal)
        register.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        register.setTitleColor(UIColor.darkGray, for: .normal)
        register.setTitleColor(UIColor.red, for: .highlighted)
        register.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: .normal)
        register.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        return register
    }()
    ///遮罩
    private lazy var maskIconView = UIImageView(image: UIImage.init(named: "visitordiscover_feed_mask_smallicon"))
    
}
