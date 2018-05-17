//
//  LYBaseViewController.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/24.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func initBaseViewController(){
        automaticallyAdjustsScrollViewInsets = false;
        view.backgroundColor = UIColor.white;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
