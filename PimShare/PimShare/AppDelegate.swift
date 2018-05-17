//
//  AppDelegate.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/24.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //设置友盟key
        configUMSharePlatforms();
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        UIApplication.shared.statusBarStyle = .lightContent
        let loginVC = LYLoginViewController()
//        let nav = LYNavigationController(rootViewController: loginVC)
        window?.rootViewController = loginVC
        
        return true
    }
    
    func configUMSharePlatforms() {
        //设置友盟key
        UMSocialManager.default().umSocialAppkey = "594726dd8f4a9d685c00204d";
        //设置友盟分享key
        //QQ
        UMSocialManager.default().setPlaform(UMSocialPlatformType.QQ, appKey: "1105714224", appSecret: nil, redirectURL: "http://mobile.umeng.com/social");
        //WX
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: "wx8955d3f77e714bb2", appSecret: "5431bac8acf1afbcfe03c523fbdbe1f2", redirectURL: nil);
        
        //友盟日志，开启，查看是否有错误
        UMCommonLogManager.setUp()
        UMConfigure.setLogEnabled(true)
        UMConfigure.initWithAppkey("594726dd8f4a9d685c00204d", channel: "App Store")

    }

    func confitUShareSettings() {
        UMSocialGlobal.shareInstance().isUsingWaterMark = true; //打开图片水印
        /*
         * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
         <key>NSAppTransportSecurity</key>
         <dict>
         <key>NSAllowsArbitraryLoads</key>
         <true/>
         </dict>
         */
//        UMSocialGlobal.shareInstance().isUsingHttpsWhenShareContent = false;
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let  result:Bool = UMSocialManager.default().handleOpen(url, options: options);
        if  !result {
         //支付等其他第三方服务的回调
        }
        return result;
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        let  result:Bool = UMSocialManager.default().handleOpen(url)
        if  !result {
            //支付等其他第三方服务的回调
        }
        return result;
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move f rom active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

