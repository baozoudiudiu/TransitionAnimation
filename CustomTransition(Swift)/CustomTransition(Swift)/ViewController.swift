//
//  ViewController.swift
//  CustomTransition(Swift)
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 Vidream_ChenWang. All rights reserved.
//

import UIKit

/// 本篇用的都是present 和 dismiss 的方式来进行页面间的切换
/// push 和 pop 或者是tabbar来切换 其实原理和这差不多.就不做过多赘述.请自行了解
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    lazy var datasources:Array<String> = {
    
        let array = ["自定义模态专场动画(无手势交互)",
                     "截图式无手势present",
                     "交互式转场动画"];
        
        return array;
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureUI();
    }

    private func configureUI() {
        
        self.view.backgroundColor = UIColor.white;
        self.title = "自定义转场动画"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        let tableView = UITableView(frame: self.view.bounds);
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        self.view.addSubview(tableView);
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.datasources.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell_id");
        
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell_id");
        }
        
        cell?.textLabel?.text = self.datasources[indexPath.row];
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true);
        
        let row = indexPath.row
        var viewController: UIViewController!
        ///此处代码可以优化,但这不是该篇的重点.所以跳过
        if row == 0
        {
            viewController = FirstViewController()
        }
        else if row == 1
        {
            viewController = FirstViewController1();
        }
        else if row == 2
        {
            viewController = InteractivePresentedVC()
        }
        viewController.title = self.datasources[row];
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

