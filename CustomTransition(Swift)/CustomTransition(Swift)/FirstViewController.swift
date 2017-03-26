//
//  FirstViewController.swift
//  CustomTransition(Swift)
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 Vidream_ChenWang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.configureUI()
    }
    
    deinit {
        
        print("\(self.classForCoder) deinit");
    }
    
    @objc private func buttonClick() {
        
        let viewController = SecondViewController()
        
        viewController.transitioningDelegate = self
        
        self.present(viewController, animated: true, completion: nil)
       
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TransitionHelper(transitionType: .presenting)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TransitionHelper(transitionType: .dismissing)
    }
    
    private func configureUI(){
        
        self.view.backgroundColor = UIColor.orange
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个页面", style: .plain, target: self, action: #selector(buttonClick))
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
