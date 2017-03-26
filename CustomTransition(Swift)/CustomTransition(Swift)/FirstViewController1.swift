//
//  FirstViewController1.swift
//  CustomTransition(Swift)
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 Vidream_ChenWang. All rights reserved.
//

import UIKit

class FirstViewController1: UIViewController , UIViewControllerTransitioningDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.orange
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "跳转界面", style: .plain, target: self, action: #selector(buttonClick))
    }
    
    @objc func buttonClick() {
        let viewController = SecondViewController1();
        viewController.transitioningDelegate = self;
        self.present(viewController, animated:true, completion: nil);
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ScreenShotAnimation(presentingStyle: .presenting)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ScreenShotAnimation(presentingStyle: .dismissing)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
