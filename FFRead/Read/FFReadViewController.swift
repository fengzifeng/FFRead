//
//  FFReadViewController.swift
//  FFRead
//
//  Created by feng on 2020/11/6.
//  Copyright © 2020 feng. All rights reserved.
//

import UIKit

class FFReadViewController: UIViewController {
    
    var _pageModel:FFReadPageModel!
    var pageModel:FFReadPageModel! {
        set {
            _pageModel = newValue
            readView.pageModel = pageModel
            readView.frame = CGRect.init(x: 20, y: StateBarH, width: ScreenWidth - 40, height: pageModel.height)
            readView.setNeedsDisplay()
        }
        get {
            return _pageModel
        }
    }
    
    var readView:FFReadView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    func setupViews() {
        readView = FFReadView()
        view.addSubview(readView)
    }
    

}
