//
//  LYLoginView.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/25.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit
import SnapKit
class LYLoginView: LYBaseView {

    
    
    //FIXME:ly 这里private 私有 被（set修饰之后）可以在外部访问（ set方法private，get方法internal）
//    private(set) var logoImageView: UIImageView ？
//    private(set) var usernameTextField: UITextField ？
//    private(set) var passwordTextField: UITextField ？
//    private(set) var rememberPWButton: UIButton ？
//    private(set) var loginButton: UIButton ？
//    private(set) var settingButton: UIButton ？
    
    private (set) var logoImageView: UIImageView?
    private (set) var usernameTextField: UITextField?
    private (set) var passwordTextField: UITextField?
    private (set) var rememberPWDButton: UIButton?
    private (set) var loginButton: UIButton?
    private (set) var settingButton: UIButton?
    
    override func initial() {
        logoImageView = UIImageView.init(image: UIImage.init(named: "logo_pimc"));
        let leftView = UIImageView(frame:CGRect(x: 0, y: 0, width: 14, height: 80))
        leftView.image = UIImage.init(named: "")
        let leftView1 = UIImageView(frame:CGRect(x: 0, y: 0, width: 14, height: 80))
        leftView1.image = UIImage.init(named: "")
      
        //如果有不需要设置的参数直接去掉，去选择默认值
        usernameTextField = createGeneralTextField(placeholder: "账号或邮箱", font: UIFont.systemFont(ofSize: 12), leftView: leftView, leftViewMode: .always,  secureTextEntry: false, keyBoardType: .default, tag: 10, borderWidth: 1, borderColor: UIColor(hexString: "DCDBDB")!)
        
        passwordTextField  = createGeneralTextField(placeholder: "密码", font: UIFont.systemFont(ofSize: 12), leftView: leftView1, leftViewMode: .always,  secureTextEntry: true,  tag: 11, borderWidth: 1, borderColor: UIColor(hexString: "DCDBDB")!)
            self.addSubview(logoImageView!)
            self.addSubview(usernameTextField!)
            self.addSubview(passwordTextField!)

//           rememberPWDButton =   createGeneralButton(normalImage: "icon_jizhumima",selectImage: "icon_jizhumima_on", text: "记住密码", textColor: (UIColor(hexString: "72721")!,font: UIFont.systemFont(ofSize: 12)),
          rememberPWDButton =  createGeneralButton(normalImage: "icon_jizhumima", selectedImage: "icon_jizhumima_on", text: "记住密码", textColor: UIColor.black, font: UIFont.systemFont(ofSize: 12))
 rememberPWDButton?.isSelected = true
        rememberPWDButton?.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5)
        self.addSubview(rememberPWDButton!)
        
        loginButton = createGeneralButton(text: "登陆", textColor: UIColor.white, selectedColor: UIColor.white, backgroundColor: UIColor(hexString: "036EB8"), font: UIFont.systemFont(ofSize: 12))
        self.addSubview(loginButton!)
        
        settingButton = createGeneralButton( text: "设置", textColor: UIColor(hexString: "036EB8")!, font: UIFont.systemFont(ofSize: 11))
        self.addSubview(settingButton!)
        
        logoImageView?.snp.makeConstraints({ (make) in
            make.topMargin.equalTo(175*WID);
            make.centerX.equalToSuperview();
        })
        
        usernameTextField?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(72*WID)
            make.right.equalToSuperview().offset(-72*WID)
            make.height.equalTo(40*WID)
          make.top.equalTo((logoImageView?.snp.bottom)!).offset(175*WID)
        })
        
        passwordTextField?.snp.makeConstraints({ (make) in
            make.left.right.height.equalTo(usernameTextField!)
          make.top.equalTo(usernameTextField!.snp.bottom).offset(10*WID)
        })
        
        rememberPWDButton?.snp.makeConstraints({ (make) in
            make.right.equalTo(usernameTextField!.snp.right)
            make.top.equalTo(passwordTextField!.snp.bottom).offset(10*WID)
        })
        
        loginButton?.snp.makeConstraints({ (make) in
            make.left.right.height.equalTo(usernameTextField!)
            make.top.equalTo(rememberPWDButton!.snp.bottom).offset(10*WID)
        })
        
        settingButton?.snp.makeConstraints({ (make) in
            make.bottom.equalToSuperview().offset(-20*WID)
            make.centerX.equalToSuperview()
        })
    }

}
