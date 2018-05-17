//
//  LYBaseModel.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/25.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYBaseModel: NSObject {

  convenience   init(dict:[String:Any]?) {
        self.init()
        if let data = dict {
            setValuesForKeys(data)
        }
    }
    
    //OC中防止出现多余字段崩溃的方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
