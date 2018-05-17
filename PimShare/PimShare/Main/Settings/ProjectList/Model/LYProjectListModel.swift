//
//  LYProjectListModel.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/25.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit
import SwiftyJSON

@objcMembers   //这里并不知道是什么
class LYProjectListModel: LYBaseModel {
 
    var  id : String?
    var name: String?
    var imgurl: String?
    var createtime: String?
    var leadername: String?
    var searchName: String = ""
    var defaultProject: NSNumber = NSNumber(value: false)
 
    init(jsonData:JSON) {
        id = jsonData["id"].stringValue
        name = jsonData["name"].stringValue
        imgurl = jsonData["imgurl"].stringValue
        createtime = jsonData["createtime"].stringValue
        leadername = jsonData["leadername"].stringValue
        searchName = jsonData["searchName"].stringValue
        defaultProject = jsonData["defaultProject"].numberValue
    }
    
    required init(coder aDecoder:NSCoder) {
        super.init()
        id = aDecoder.decodeObject(forKey: "id") as? String
        
        
    }
    
    func encode(with aCoder:NSCoder)  {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(imgurl, forKey: "imgurl")
        aCoder.encode(createtime, forKey: "createtime")
        aCoder.encode(leadername, forKey: "leadername")
        aCoder.encode(searchName, forKey: "searchName")
        aCoder.encode(defaultProject, forKey: "defaultProject")
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
