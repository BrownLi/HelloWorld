//
//  LYUCMainVIew.swift
//  PimShare
//
//  Created by 李阳 on 2018/5/8.
//  Copyright © 2018年 李阳. All rights reserved.
//

import UIKit

class LYUCMainView: LYBaseView ,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{

  private (set) var headView :UIView?
  private (set) var temperatureLab :UILabel?
  private (set) var areaLab :UILabel?
  private (set) var airLab :UILabel?
  private (set) var headImageView :UIView?
  private (set) var collectionView : UICollectionView?
  private (set) var searchTF :UITextField?
  private (set) var bgView :UIView?
    private let flowLayout : UICollectionViewFlowLayout = {
        let flt = UICollectionViewFlowLayout()
//        flt.minimumLineSpacing = 0
//        flt.minimumInteritemSpacing = 0
        flt.scrollDirection = UICollectionViewScrollDirection.vertical
//        flt.itemSize = UIScreen.main.bounds.size
        return flt
    }()
    

    
    override func initial() {
        headView = UIView.init()
        headView?.backgroundColor = UIColor(red: 60/255.0, green: 135/255.0, blue: 185/255.0, alpha: 0.8)
        self.addSubview(headView!)
        temperatureLab = createGeneralLabel(text:"22°" ,textColor: .white, font: .systemFont(ofSize: 40), textAlignment: .center)
        self.addSubview(temperatureLab!)
        
        areaLab = createGeneralLabel(text: "海淀区 晴", textColor: .white, font: .systemFont(ofSize: 12), textAlignment: .left)
        self.addSubview(areaLab!)
        
        airLab = createGeneralLabel(text: "58 空气良", textColor: .white, font: .systemFont(ofSize: 12), textAlignment: .left)
        self.addSubview(airLab!)
        headImageView = UIImageView.init(image: UIImage(named: "1"))
        self.addSubview(headImageView!)
        
        bgView = UIView()
        bgView?.alpha = 0.1
        bgView?.backgroundColor = UIColor.white
        bgView?.layer.cornerRadius = 10.0
        bgView?.layer.masksToBounds = true
        self.addSubview(bgView!)
        let leftView = UIButton(type: .custom)
        leftView.setImage(UIImage.init(named: "icon_shezhi"), for: .normal)
        leftView.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
        leftView.frame = CGRect(x: 10, y: 10*WID, width: 40*WID, height: 40*WID)
        searchTF = createGeneralTextField( textColor: .white, font: .systemFont(ofSize: 14), leftView: leftView, leftViewMode: .always, tag: 10)
        searchTF?.backgroundColor = UIColor.clear
        searchTF?.text = "搜索或输入网址"
        searchTF?.layer.cornerRadius = 10.0
        searchTF?.layer.masksToBounds = true
        self.addSubview(searchTF!)

        collectionView = UICollectionView.init(frame: CGRect.null, collectionViewLayout: flowLayout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(LYCollectionViewCell.self, forCellWithReuseIdentifier: "LYCollectionViewCell")
        collectionView?.register(LYCollectionViewTitleCell.self, forCellWithReuseIdentifier: "LYCollectionViewTitleCell")
    
        collectionView?.backgroundColor = UIColor.clear
        self.addSubview(collectionView!)
        

        beginLayout()
                collectionView?.reloadData()
    }
    
    func beginLayout() {
        headView?.snp.makeConstraints({ (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(200*WID)
        })

        temperatureLab?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(15*WID)
            make.top.equalToSuperview().offset(30*WID)
            make.height.equalTo(getLabHeight(labelStr: "22°", font: .systemFont(ofSize: 40), width: 100))
            make.width.equalTo(getLabWidth(labelStr: "22°", font: .systemFont(ofSize: 40), height: getLabHeight(labelStr: "22°", font: .systemFont(ofSize: 40), width: 100)))
        })
        areaLab?.snp.makeConstraints({ (make) in
            make.left.equalTo((temperatureLab?.snp.right)!).offset(10*WID)
            make.top.equalTo(temperatureLab!)
            make.height.equalTo(14*WID)
        })
        airLab?.snp.makeConstraints({ (make) in
            make.left.right.height.equalTo(areaLab!)
            make.bottom.equalTo(temperatureLab!.snp.bottom)
        })
        headImageView?.snp.makeConstraints({ (make) in
            make.right.top.equalTo(headView!)
        })
        
        bgView?.snp.makeConstraints({ (make) in
            make.left.equalTo(headView!).offset(15*WID)
            make.right.equalTo(headView!).offset(-15*WID)
            make.top.equalTo(temperatureLab!.snp.bottom).offset(20*WID)
            make.height.equalTo(40*WID)
        })
        searchTF?.snp.makeConstraints({ (make) in
            make.left.equalTo(headView!).offset(15*WID)
            make.right.equalTo(headView!).offset(-15*WID)
            make.top.equalTo(temperatureLab!.snp.bottom).offset(20*WID)
            make.height.equalTo(40*WID)
        })
        
        collectionView?.snp.makeConstraints({ (make) in
            make.top.equalTo((searchTF?.snp.bottom)!).offset(15*WID)
            make.left.right.bottom.equalToSuperview()
        })
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 6
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section <= 3 {
            let  cell:LYCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LYCollectionViewCell", for: indexPath) as! LYCollectionViewCell

            cell.titleImageView?.image = UIImage.init(named: "2")
            cell.titleLab?.text = "新浪"
            return cell
        }else{
            let  cell:LYCollectionViewTitleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LYCollectionViewTitleCell", for: indexPath) as! LYCollectionViewTitleCell

            cell.titlLab?.text = "新浪"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section <= 3 {
            return CGSize(width: 30*WID, height: 45*WID)
        }else{
            return CGSize(width: 30*WID, height: 20*WID)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if section == 0 {
//            return
//        }
        return 30*WID
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12*WID
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
          return UIEdgeInsetsMake(0,(WIDTH-30*WID*5)/5, 20, (WIDTH-30*WID*5)/5)
        }
          return UIEdgeInsetsMake(20,(WIDTH-30*WID*5)/10, 20, (WIDTH-30*WID*5)/10)
    }
    
    func getLabHeight(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr as NSString
        
        let size = CGSize(width: width, height: 900)
        
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context: nil).size
        
        return strSize.height
        
    }
    
    
    
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr as NSString
        
        let size = CGSize(width: 900, height: height)
        
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context: nil).size
        
        return strSize.width
        
    }
    

}
