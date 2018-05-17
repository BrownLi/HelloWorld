//
//  Common.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/27.
//  Copyright © 2018年 李阳. All rights reserved.
//

import Foundation
import UIKit

let API_PROTOCOL = "http"
let API_HOST = "192.168.11.105:8080"
let API_PREFIX = "/epc/api/"


/**切换环境*/
#if DEVELOP
let API_BASE = API_PROTOCOL + "://" + API_HOST + API_PREFIX

var BaseUrl = "http://192.168.11.105:8080"

#else
let API_BASE = API_PROTOCOL + "://" + API_HOST + API_PREFIX
var BaseUrl = "http://192.168.11.105:8080"

#endif


var OriginalUrl = "\(BaseUrl)/epc/api/"


/**接口*/
enum MessageType: Int {
    case system = 1
    case plan = 2
    case document = 3
    case teamwork = 4
}
