//
//  InteractiveAnimator.swift
//  CustomTransition(Swift)
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 Vidream_ChenWang. All rights reserved.
//

import UIKit



class InteractiveAnimator: UIPercentDrivenInteractiveTransition {
    
    
    /// 转场类型
    private let transitionType: CWTransitionType
    
    /// 手势方向
    private let gestureDirection: CWTransitionGestureDeriction
    
    /// 手势是否在执行中
    var interaction: Bool = false
    
    /// 需要添加手势的controller
    weak private var vc: UIViewController!
    
    /// 手势百分比,根据这个来更新动画的进度
    private var present: CGFloat = 0
    
    /// 手势开始,执行的转场block
    private var startGestureBlock: (() -> Void)?
    
    init(with transitionType:CWTransitionType, gestureBlock: (() -> Void)?, direction: CWTransitionGestureDeriction) {
        
        self.transitionType = transitionType
        
        self.startGestureBlock = gestureBlock
        
        self.gestureDirection = direction
    }
    
    ///为controller添加手势
    func addPanGestureForViewController(_ viewController: UIViewController) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(pan:)))
        self.vc = viewController
        viewController.view.isUserInteractionEnabled = true
        viewController.view.addGestureRecognizer(pan)
        
    }

    ///计算手势百分比,用来更新动画的进度
    private func getPresentWith(gesture: UIPanGestureRecognizer) -> CGFloat{
        
        var present: CGFloat = 0
        
        let point = gesture.translation(in: self.vc.view)
        
        let width = self.vc.view.frame.size.width  * 0.75
        let height = self.vc.view.frame.size.height  * 0.75
        
        let x = point.x
        let y = point.y
        
        let final_x = x > 0 ? x : (x * -1)
        let final_y = y > 0 ? y : (y * -1)
        
        let gestureDirection = self.gestureDirection
            
        if (gestureDirection == .left && x < 0)
        {
            present = final_x / width
        }
        else if (gestureDirection == .right && x > 0)
        {
            present = final_x / width
        }
        else if gestureDirection == .up && y < 0
        {
            present = final_y / height
        }
        else if gestureDirection == .dowm && y > 0
        {
            present = final_y / height
        }
        
        return present
    }
    
    
    /// 手势回调方法
    ///
    /// - Parameter pan: 手势
    @objc private func handleGesture(pan: UIPanGestureRecognizer) {
        
        self.present = self.getPresentWith(gesture: pan)
        
        print("present: \(self.present)")
        
        switch pan.state
        {
            
        case .began:
            ///手势开始,打开标记为true
            self.interaction = true
            ///开始执行转场
            self.startGesture()
        case .changed:
            ///不停的根据present来更新动画的进度
            self.update(self.present)
        case .ended:
            ///手势结束,关闭标记为false
            self.interaction = false
            if self.present >= 0.5
            {
                ///如果移动的距离百分比大于0.5,则完成动画
                self.finish()
            }
            else
            {
                ///否则取消动画,回到最初状态
                self.cancel()
            }
        default:
            ///取消动画,回到最初状态
            self.interaction = false
            self.cancel()
        }
        
    }
    
    private func startGesture() {
        if self.transitionType == .presenting
        {
            ///如果是present到下一个界面,则执行外部传入的block
            if let block = self.startGestureBlock
            {
                block()
            }
        }
        else if self.transitionType == .dismissing
        {
            ///否则,是dismiss状态,跳回到上级页面
            self.vc.dismiss(animated: true, completion: nil);
        }
    }
    
    
    
    
    
    
    
    
    
}
