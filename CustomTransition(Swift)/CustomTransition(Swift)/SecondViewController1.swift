//
//  SecondViewController1.swift
//  CustomTransition(Swift)
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 Vidream_ChenWang. All rights reserved.
//

import UIKit

class SecondViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        self.configureUI()
    }
    
    private func configureUI() {
        
        let image = UIImage(named: "timg.jpeg")
        let imageView = UIImageView(image: image)
        imageView.frame = self.view.bounds
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: true, completion: nil)
        
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
