//
//  LYCollectionViewCell.swift
//  PimShare
//
//  Created by 李阳 on 2018/5/8.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYCollectionViewCell: UICollectionViewCell {
    
    var titleLab:UILabel?
    var titleImageView :UIImageView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleImageView = UIImageView.init()
        titleImageView?.image = UIImage.init(named: "2")
        self.addSubview(titleImageView!)
        
        titleLab = createGeneralLabel( textColor: .black, font: .systemFont(ofSize: 11), textAlignment: .center)
        titleLab?.text = "新浪"
        self.addSubview(titleLab!)
        
        titleImageView?.snp.makeConstraints({ (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(35*WID)
        })
        
        titleLab?.snp.makeConstraints({ (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo((titleImageView?.snp.bottom)!).offset(5*WID)
            make.height.equalTo(12*WID)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
