//
//  TestViewController.swift
//  swiftTest
//
//  Created by feng on 2019/11/4.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.setNavigationBackButtonDefault()
        
        var pageVc = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.pageCurl, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: [UIPageViewController.OptionsKey.interPageSpacing:20])
        pageVc.delegate = self
        pageVc.dataSource = self
        
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let beforeVc = UIViewController.init()
        return beforeVc;
        
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let afterVc = UIViewController.init()
        return afterVc;
    }
    
    
    
    
    
    
    
}
