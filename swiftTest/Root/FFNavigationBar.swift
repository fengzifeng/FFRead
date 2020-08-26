//
//  FFNavigationBar.swift
//  swiftTest
//
//  Created by feng on 2019/11/1.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class FFNavigationBar: UINavigationBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if ShortSystemVersion >= CGFloat(11) {
            for view : UIView in self.subviews {
                if NSStringFromClass(type(of: view)).contains("Background") {
                    view.frame = self.bounds
                } else if NSStringFromClass(type(of: view)).contains("ContentView") {
                    var frame = view.frame
                    frame.origin.y = UIApplication.shared.statusBarFrame.size.height
                    frame.size.height = self.bounds.size.height - frame.origin.y
                    view.frame = frame
                }
            }
        }
    }

}
