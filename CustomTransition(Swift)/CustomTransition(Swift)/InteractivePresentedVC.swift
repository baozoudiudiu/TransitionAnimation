//
//  InteractivePresentedVC.swift
//  CustomTransition(Swift)
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 Vidream_ChenWang. All rights reserved.
//

import UIKit

class InteractivePresentedVC: UIViewController , UIViewControllerTransitioningDelegate{

    var presentInteractiveManager: InteractiveAnimator?
    var dismissInteractiveManager: InteractiveAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.configureUI()
    }
    
    private func configureUI() {
        
        self.view.backgroundColor = UIColor.lightGray
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "跳转页面", style: .plain, target: self, action: #selector(buttonClick))
        
        self.presentInteractiveManager = InteractiveAnimator(with: .presenting, gestureBlock: {
            let viewController = InteractivePresentingVC()
            viewController.transitioningDelegate = self
            self.present(viewController, animated: true, completion: nil)
            self.dismissInteractiveManager = InteractiveAnimator(with: .dismissing, gestureBlock: nil, direction: .left)
            self.dismissInteractiveManager?.addPanGestureForViewController(viewController)
        }, direction: .right)
        self.presentInteractiveManager?.addPanGestureForViewController(self)
    }
    
    @objc private func panChanged(pan: UIPanGestureRecognizer) {
        
    }
    
    @objc private func buttonClick() {
        
        let viewController = InteractivePresentingVC()
        
        viewController.transitioningDelegate = self
        
        self.present(viewController, animated: true, completion: nil)
        
        self.dismissInteractiveManager = InteractiveAnimator(with: .dismissing, gestureBlock: nil, direction: .left)
        self.dismissInteractiveManager?.addPanGestureForViewController(viewController)
    }
    
    //MARK: -- UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ScreenShotAnimation(presentingStyle: .presenting)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ScreenShotAnimation(presentingStyle: .dismissing)
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
       
        return self.presentInteractiveManager!.interaction ? self.presentInteractiveManager : nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        ///
        return self.dismissInteractiveManager!.interaction ? self.dismissInteractiveManager : nil
    }
    
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
