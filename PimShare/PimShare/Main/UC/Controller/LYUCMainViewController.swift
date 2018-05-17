//
//  LYUCMainViewController.swift
//  PimShare
//
//  Created by 李阳 on 2018/5/8.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYUCMainViewController: LYBaseViewController {
    var mainView : LYUCMainView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        mainView = LYUCMainView(frame: CGRect.null, superView: self.view)
        mainView?.snp.makeConstraints({ (make) in
            make.left.right.top.bottom.equalToSuperview()
            
        })
        print("UC--VC")
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
