//
//  SecondViewController.swift
//  CustomTransition(Swift)
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 Vidream_ChenWang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.configureUI()
    }

    deinit {
        
        print("\(self.classForCoder) deinit");
    }
    
    private func configureUI() {
    
        self.view.backgroundColor = UIColor.yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
