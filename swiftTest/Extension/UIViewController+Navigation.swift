//
//  UIViewController+Navigation.swift
//  swiftTest
//
//  Created by feng on 2019/11/1.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationTitleView(view : UIView) {
        if self.isKind(of: BaseViewController.self) {
            let vc : BaseViewController = self as! BaseViewController
            vc.myNavigationItem.titleView = view
        } else {
            self.navigationItem.titleView = view
        }
    }
    
    func setNavigationBackButtonDefault() {
        self.setNavBackButtonWithTitle(title: nil)
    }
    
    func setNavBackButtonWithTitle(title : String?) {
        let backButton = UIButton.newBackArrowNavButtonWith(target: self, action: #selector(navigationBackButtonAction(button:)))
        
        var tempTitle = title
        
        if (tempTitle == nil) {
            tempTitle = "返回"
        }
        
        backButton.setTitle(tempTitle, for: UIControl.State.normal)
        
        let width = tempTitle?.stringWidthWith(font: UIFont.systemFont(ofSize: 16), height: 44)
        backButton.frame = CGRect.init(x: 0, y: 0, width: min(width ?? 0, 80) + 20, height: 44)
        backButton.isExclusiveTouch = true
        self.setNavigationLeftView(view: backButton)
    }
    
    @objc func navigationBackButtonAction(button : UIButton) {
        if (self.navigationController?.viewControllers.count == 1) {
        }
        else if ((self.navigationController) != nil) {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func setNavigationLeftView(view : UIView) {
    
        if view.isKind(of: UIButton.self) {
            let button : UIButton = view as! UIButton
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        }
        
        let buttonItem = UIBarButtonItem.init(customView: view)
        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        negativeSpacer.width = 5
        
        if self.isKind(of: BaseViewController.self) {
            let vc : BaseViewController = self as! BaseViewController
            vc.myNavigationItem.leftBarButtonItems = [negativeSpacer, buttonItem]
        } else {
            self.navigationItem.leftBarButtonItems = [negativeSpacer, buttonItem]
            
        }
        
        func setNavigationRightView(view : UIView) {
            
            if view.isKind(of: UIButton.self) {
                let button : UIButton = view as! UIButton
                button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            }
            
            let buttonItem = UIBarButtonItem.init(customView: view)
            let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
            negativeSpacer.width = 5
            
            if self.isKind(of: BaseViewController.self) {
                let vc : BaseViewController = self as! BaseViewController
                vc.myNavigationItem.rightBarButtonItems = [negativeSpacer, buttonItem]
            } else {
                self.navigationItem.rightBarButtonItems = [negativeSpacer, buttonItem]
                
            }
        }
    }
    
}


