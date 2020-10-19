//
//  FFMainViewController.swift
//  swiftTest
//
//  Created by feng on 2019/11/1.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class FFMainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 60, height: 60))
        button.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        button.setTitle("跳转", for: UIControl.State.normal)
        button.setTitleColor(UIColor.red, for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let parentVc : BaseViewController = self.parent as! BaseViewController
        parentVc.myTitle = "首页"
    }
    
    @objc func click() {
        let vc = TestViewController.init()
        rootNav.pushViewController(vc, animated: true)
    }
}
