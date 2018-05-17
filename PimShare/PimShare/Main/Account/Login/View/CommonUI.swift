//
//  CommonUI.swift
//  PimShare
//
//  Created by 李阳 on 2018/4/25.
//  Copyright © 2018年 李阳. All rights reserved.
//

import Foundation
import Then
import YYKit

let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height
let WID = WIDTH/375

func createGeneralLabel(
    text:String = "",
    textColor:UIColor = UIColor.black,
    font:UIFont = UIFont.systemFont(ofSize: 18),
    textAlignment :NSTextAlignment = NSTextAlignment.left
    ) -> UILabel {
    let label = UILabel.init()
    label.text = text
    label.textColor = textColor
    label.font = font
    label.textAlignment = textAlignment
    return label
}

func createGeneralTextField(
    //这里使用了参数的默认值，如果没有传入指定参数的话将使用默认值继续
    placeholder: String = "",
    textColor: UIColor = UIColor.black,
    font: UIFont = UIFont.systemFont(ofSize: 18),
    leftView: UIView? = nil,
    leftViewMode: UITextFieldViewMode = .never,
    rightView: UIView? = nil,
    rightViewMode: UITextFieldViewMode = .never,
    secureTextEntry: Bool = false,
    keyBoardType: UIKeyboardType = .default,
    tag: Int = 0,
    backgroundColor: UIColor = UIColor.white,
    borderWidth: CGFloat = 0,
    borderColor: UIColor = UIColor.white
    ) -> UITextField {
    let textfiled = UITextField.init().then { (tf) in
       
        //设置placeholder字体颜色
        let placeholderAttributes = NSMutableAttributedString(string: placeholder)
        placeholderAttributes.addAttributes([NSAttributedStringKey.foregroundColor : UIColor(hexString: "72721")], range: NSMakeRange(0, placeholder.count))
        
        tf.placeholder = placeholder
        tf.textColor = textColor
        tf.font = font
        tf.leftView = leftView
        tf.leftViewMode = leftViewMode
        tf.rightView = rightView
        tf.rightViewMode = rightViewMode
        tf.isSecureTextEntry = secureTextEntry
        tf.keyboardType = keyBoardType
        tf.tag = tag
        tf.backgroundColor = backgroundColor
        tf.layer.borderWidth = borderWidth
        tf.layer.borderColor = borderColor.cgColor
    }
    return textfiled
}

func createGeneralButton(
    normalImage: String = "",
    normalBGImage: String = "",
    selectedImage: String = "",
    text: String = "",
    textColor: UIColor = UIColor.white,
    selectedColor: UIColor? = nil,
    backgroundColor: UIColor? = UIColor.white,
    font: UIFont = UIFont.systemFont(ofSize: 18),
    masksToBounds: Bool = false,
    cornerRadius: CGFloat = 0,
    tag: Int = 0
    ) -> UIButton {
    
    let button = UIButton.init(type: UIButtonType.custom).then {
        
        $0.setTitle(text, for: .normal)
        $0.setTitleColor(textColor, for: .normal)
        $0.titleLabel?.font = font
        $0.tag = tag
        $0.isOpaque = true
        if let selectedColor = selectedColor {
            $0.setTitleColor(selectedColor, for: .selected)
        }
        
        if !normalImage.isEmpty {
            $0.setImage(UIImage(named:normalImage), for: .normal)
        }
        
        if !normalBGImage.isEmpty {
            $0.setBackgroundImage(UIImage(named:normalBGImage), for: .normal)
        }
        
        if !selectedImage.isEmpty {
            $0.setImage(UIImage(named:selectedImage), for: .selected)
        }
        if masksToBounds {
            $0.layer.masksToBounds = masksToBounds
            $0.layer.cornerRadius = cornerRadius
        }
        
        $0.backgroundColor = backgroundColor
    }
    
    return button
}

////根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
//func getLabHeigh(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
//    
//    let statusLabelText: String = labelStr
//    
//    let size = CGSize(width: width, height: 900)
//    
//    let dic = Dictionary.init()
//    dic.set
//    let strSize = statusLabelText.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
//    
//    return strSize.height
//    
//}
//
//
//
//func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
//    
//    let statusLabelText: String = labelStr
//    
//    let size = CGSize(width: 900, height: height)
//    
//    
//    let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
//    
//    let strSize = statusLabelText.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
//    
//    return strSize.width
//    
//}
