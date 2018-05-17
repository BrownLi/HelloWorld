//
//  LYLoginViewController.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/25.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYLoginViewController: LYBaseViewController {

    var mainView: LYLoginView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMainView();
    }

    private func setUpMainView (){
        mainView = LYLoginView(frame:CGRect.null, superView: self.view)
        mainView?.snp.makeConstraints({ (make) in
            make.left.right.top.bottom.equalToSuperview();
        })
        mainView?.loginButton?.addTarget(self, action: #selector(loginBtnClick(sender:)), for: .touchUpInside)
    }
    @objc func loginBtnClick(sender:UIButton) {
//        let projectVc = LYProjectViewController()
//        let nav = LYNavigationController.init(rootViewController: projectVc)
//        self.present(nav, animated: true) {
//            
//        }
        let UCMainVc = LYUCMainViewController()
        self.present(UCMainVc, animated: true) {
            
        }
        
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
