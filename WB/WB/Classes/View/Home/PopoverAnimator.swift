//
//  PopoverAnimator.swift
//  WB
//
//  Created by 刘艳法 on 2017/3/30.
//  Copyright © 2017年 刘艳法. All rights reserved.
//

import UIKit
//定义常量实现宏定义
let PopoverAnimatorWillShow = "PopoverAnimatorWillShow"
let PopoverAnimatorWillDissmiss = "PopoverAnimatorWillDissmiss"

class PopoverAnimator: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    
    var isPresent = false
    
    //定义属性保存菜单的大小
    var presentFrame = CGRect.zero
    
    // 实现代理,谁来负责转场动画
    //UIPresentationController ios推出的,专门负责转场动画
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let pc = PopoverPresentationController(presentedViewController: presented, presenting: presenting)
        pc.presentFrame = presentFrame
        
        return pc
    }
    // 只要实现了下面方法,系统默认动画都没有了,需要程序员自己来实现
    //告诉系统谁来负责modal展现动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        //发送通知,即将展开
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: PopoverAnimatorWillShow), object: self)
        return self
    }
    //告诉系统谁负责modal的消失动画
    func animationController(forDismissed dismissed: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
            isPresent = false
            //发送通知,即将关闭
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:PopoverAnimatorWillDissmiss), object: self)
            return self
    }
    //返回动画时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    //如何返回
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresent {
            
            
            //1 拿到展示视图
//            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
//            
            
            //2
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            toView?.transform = __CGAffineTransformMake(1.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            //注意:一定要添加到容器上
            transitionContext.containerView.addSubview(toView!)
            //设置锚点
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            //执行动画
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                // 清空transform
                toView?.transform = CGAffineTransform.identity
            }) { (_) -> Void in
                //执行动画完一定要告诉系统
                //如果不写,可能导致一些未知错误
                transitionContext.completeTransition(true)
            }
        } else {
            //关闭
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                //压扁
                // cgfloat是不准确的,如果写0是没有动画的
                fromView?.transform = __CGAffineTransformMake(1.0, 0.0, 0.0, 0.00001, 0.0, 0.0)
            }, completion: { (_) -> Void in
                transitionContext.completeTransition(true)
            })
        }
    }
}
