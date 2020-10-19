//
//  ViewController.swift
//  swiftTest
//
//  Created by feng on 2019/10/29.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class RootViewController: BaseViewController, FFBarViewDelegate {
    
    private let titleArray = ["test1","test2"]
    
    var currentViewController : BaseViewController?
    var navArray = [FFMainViewController.init(), FFDiscoverViewController.init(), FFMeViewController.init()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        self.view.addSubview(barView)
        self.swithchTapIndex(index: 0)
    }
    
    lazy var barView: FFBarView = {
        let barView = FFBarView.init(frame: CGRect.init(x: 0, y: self.view.height - BarH, width: ScreenWidth, height: BarH))
        barView.delegate = self
//        barView.backgroundColor = UIColor.red
        
        return barView
    }()
    
    func swithchTapIndex(index: NSInteger) {
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        currentViewController = navArray[index]
        self.addChild(currentViewController!)
        self.view.insertSubview(currentViewController!.view, belowSubview: navigationBar)
    }
}



