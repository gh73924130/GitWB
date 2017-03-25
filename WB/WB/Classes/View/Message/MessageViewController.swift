//
//  MessageViewController.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/24.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            visiter?.setupInfo("visitordiscover_image_message", title: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知", isHome: false)
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
