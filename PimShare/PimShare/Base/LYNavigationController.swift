//
//  LYNavigationController.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/24.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
 
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true;
            let leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_fanhui")?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftItemDidClick));
            viewController.navigationItem.leftBarButtonItem = leftBarButtonItem;
        }
        super.pushViewController(viewController, animated: animated);
    }
    
    @objc func leftItemDidClick() {
        popViewController(animated: true);
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
