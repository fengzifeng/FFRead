//
//  BaseViewController.swift
//  swiftTest
//
//  Created by feng on 2019/11/1.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var _myTitle: String
    var myTitle : String {
        set {
            self.myNavigationItem.title = newValue;
        }
        get {
            return self.myNavigationItem.title ?? _myTitle
        }
    }
    
    lazy var navigationBar : FFNavigationBar = {
        let navigationBar : FFNavigationBar = FFNavigationBar.init()
        navigationBar.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: NavH - 0.5)
        navigationBar.barTintColor = UIColor.white
        navigationBar.isTranslucent = false
        
        let shadow = NSShadow.init()
        shadow.shadowColor = UIColor.clear
        let shadowImage = UIImage.imageWithColor(color: HexColor(value: 0xececec), size: CGSize.init(width: ScreenWidth, height: 0.5))
        navigationBar.shadowImage = shadowImage
        navigationBar.pushItem(self.myNavigationItem, animated: false)
        return navigationBar
    }()
    
    lazy var myNavigationItem : UINavigationItem = {
        let myNavigationItem : UINavigationItem = UINavigationItem.init(title: "")
        return myNavigationItem
    }()
    
    @objc func enableScreenEdgePanGesture() -> Bool {
        return true
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        _myTitle = ""
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        _myTitle = ""
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.navigationBar)
    }
}
