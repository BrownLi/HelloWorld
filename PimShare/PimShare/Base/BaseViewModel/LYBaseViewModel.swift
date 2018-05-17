//
//  LYBaseViewModel.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/24.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import SwiftyJSON
import MBProgressHUD


            //所有的ViewModel都要遵守Request协议，使用method 来区分是get请求还是post请求
class LYBaseViewModel: NSObject ,Request{

    var url: URL {
        if method == .get {
            return URL(string: BaseUrl + path)!
        }else{
            return URL(string: BaseUrl + path)!
        }
    }
    
    var path: String = "/epc/api/"
    
    var baseURLtring: String = BaseUrl
    
    var method: HTTPMethod = .post
    
    var parameters: [String : Any]? = [:]
    
    var disponsebag = DisposeBag()
    
    
    func handleStatusError(value: Int) {
        
        var message = ""
        
        switch value {
        case 1001:
            message = "用户名或密码错误"
        case 1002:
            message = "用户不存在"
        case 1003:
            message = "用户已过期"
        case 1004:
            message = "用户所在公司被禁用"
        case 1005:
            message = "用户所在公司已过期"
        case 1006:
            message = "用户没有项目不能登录"
        default:
            message = ""
        }
        
    }
    
    func handleErroeMessage(message:String)  {
          MBProgressHUD.showError(message)
    }
    
    func handleSystemEroor(error:Error) {
        ProgressHUD.hideUIBlockingIndicator()
        //FIXME:ly注意这里是NetError  不是 Error
        guard  let e = error as? NetError else {
            return
        }
        switch e {
        case  .Data:
            MBProgressHUD.showError("JSON格式错误")
        case .HTTP(let error):
            MBProgressHUD.showError(error.localizedDescription)            
        }
    }
    
    
}
