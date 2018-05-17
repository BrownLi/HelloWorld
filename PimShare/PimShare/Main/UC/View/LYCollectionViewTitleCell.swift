//
//  LYCollectionViewTitleCell.swift
//  PimShare
//
//  Created by 李阳 on 2018/5/8.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYCollectionViewTitleCell: UICollectionViewCell {
    
    var titlLab :UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titlLab = UILabel.init()
        titlLab?.font = UIFont.systemFont(ofSize: 10.0)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        self.addSubview(titlLab!)
        titlLab?.snp.makeConstraints({ (make) in
          make.edges.equalToSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
