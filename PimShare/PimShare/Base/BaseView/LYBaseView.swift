//
//  LYBaseView.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/25.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYBaseView: UIView {

     //创建便利构造器,identifiers为cell的标识
  convenience   init(frame: CGRect,superView:UIView) {
    self.init(frame: frame);
       superView.addSubview(self);
       initial();
    }
    
    
    func initial() {
        
    }
}
