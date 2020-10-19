//
//  UIButton+Common.swift
//  swiftTest
//
//  Created by feng on 2019/11/4.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

extension UIButton {

    public class func  newBackArrowNavButtonWith(target : Any, action : Selector) -> UIButton {
        let button : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 46, height: 44))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 4, bottom: 0, right: 0)
        button.setImage(UIImage.init(named: "默认返回"), for: UIControl.State.normal)
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        
        return button
    }
}
