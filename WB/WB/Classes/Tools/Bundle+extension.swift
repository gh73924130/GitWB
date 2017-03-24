//
//  Bundle+extension.swift
//  反射机制
//
//  Created by 刘艳法 on 2017/3/23.
//  Copyright © 2017年 刘艳法. All rights reserved.

import Foundation
extension Bundle {
//    func namespace() -> String {
//        return infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    
    //计算型属性
    //类似函数 没有参数有返回值
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
  }
