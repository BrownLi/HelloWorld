//
//  LYProjectViewController.swift
//  PimShare
//
//  Created by 李阳 on 2018/5/2.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYProjectViewController: LYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "项目列表"
        setupMainView()
    }
   
    func setupMainView()  {
        view.backgroundColor = UIColor.white
        let rightBtn = createGeneralButton( text: "分享", textColor: .blue, selectedColor: .black,backgroundColor:.clear, font: .systemFont(ofSize: 14.0))
        rightBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        rightBtn.addTarget(self, action: #selector(sharebtnClick(sender:)), for: .touchUpInside)
        let rightBarButonItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightBarButonItem
    }
    
    //调用分享UI面板
    @objc func sharebtnClick(sender:UIButton) {
        
        //注意： =   === ============================这里是swift 中 __weak的写法
        UMSocialUIManager.showShareMenuViewInWindow {[weak self] (platformType, userInfo) in
           self?.shareWebPageToPlatformType(platformType: platformType)
        }
    }
    
    //实现分享
    @objc func shareWebPageToPlatformType(platformType:UMSocialPlatformType) {
        
        //创建分享消息对象
        let messageObject = UMSocialMessageObject()
        let thumbURL = "https://mobile.umeng.com/images/pic/home/social/img-1.png"
        let shareObject = UMShareWebpageObject.shareObject(withTitle: "欢迎使用【友盟+】社会化组件U-Share", descr:"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！", thumImage: thumbURL)
        shareObject?.webpageUrl = "http://mobile.umeng.com/social"
        messageObject.shareObject = shareObject
        
        //调用分享接口
        UMSocialManager.default().share(to: platformType, messageObject: messageObject, currentViewController: self) { (data, error) in
            if (error != nil) {
                UMSocialLogWithLocalizedKey("抱歉啊，分享出错了=======\(error)")
            }else{
                //这里：swift没有isKindof方法 代替的是  xx is XX
                if data is UMSocialShareResponse {
                    let resp: UMSocialShareResponse = data as! UMSocialShareResponse
                    //分享结果消息
                    UMSocialLogWithLocalizedKey("友盟的返回消息是====\(resp.message)")
                     //第三方原始返回的数据
                    UMSocialLogWithLocalizedKey("response originalResponse data is \(resp.originalResponse)")
                    
                }else{
                    UMSocialLogWithLocalizedKey("response data is \(data)")
                }
            }
            
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
