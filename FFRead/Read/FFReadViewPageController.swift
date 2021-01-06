//
//  FFReadViewController.swift
//  FFRead
//
//  Created by feng on 2020/11/6.
//  Copyright © 2020 feng. All rights reserved.
//

import UIKit

class FFReadViewPageController: UIViewController {
    
    var chapterIndex: Int!
    var cacheIndex: Int!
    var _readModel: FFReadModel!
    var readModel:FFReadModel! {
        set {
            _readModel = newValue
            let pageModel: FFReadPageModel = _readModel.readItemModel.pageModels[_readModel.currentPage]
            readView.pageModel = pageModel
            readView.frame = CGRect.init(x: 20, y: StateBarH, width: ScreenWidth - 40, height: pageModel.height)
            readView.setNeedsDisplay()
            numberLabel.text = NSNumber.init(value: (_readModel.currentPage + 1)).stringValue.appending("/").appending(NSNumber.init(value: _readModel.readItemModel.pageModels.count).stringValue)
        }
        get {
            return _readModel
        }
    }
    
    lazy var numberLabel : UILabel = {
        let numberLabel = UILabel.init(frame: CGRect.init(x: ScreenWidth - 100 - 20, y: ScreenHeigth - 20 - TabDiff, width: 100, height: 20))
        numberLabel.textColor = UIColor.black
        numberLabel.font = UIFont.systemFont(ofSize: 13)
        numberLabel.textAlignment = NSTextAlignment.right
        return numberLabel
    }()
//    var chapterIndex: Int!
//    var cacheIndex: Int!
//
//    var _pageModel:FFReadPageModel!
//    var pageModel:FFReadPageModel! {
//        set {
//            _pageModel = newValue
//            readView.pageModel = pageModel
//            readView.frame = CGRect.init(x: 20, y: StateBarH, width: ScreenWidth - 40, height: pageModel.height)
//            readView.setNeedsDisplay()
//        }
//        get {
//            return _pageModel
//        }
//    }
    
    var readView:FFReadView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(numberLabel)
    }
    
    func setupViews() {
        readView = FFReadView()
        view.addSubview(readView)
    }
    

}
