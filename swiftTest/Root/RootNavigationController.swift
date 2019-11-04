//
//  RootNavigationController.swift
//  swiftTest
//
//  Created by feng on 2019/11/1.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }

}

extension RootNavigationController : UINavigationControllerDelegate, UIGestureRecognizerDelegate {
        func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count == 1 {
            return false
        }
        
        let topVC : BaseViewController = self.topViewController as! BaseViewController
        if topVC.responds(to: #selector(topVC.enableScreenEdgePanGesture)) {
            return topVC.enableScreenEdgePanGesture()
        }
        return true
    }
}
