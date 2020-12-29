//
//  FFReadViewController.swift
//  FFRead
//
//  Created by feng on 2020/12/25.
//  Copyright © 2020 feng. All rights reserved.
//

import UIKit

class FFReadViewController: BaseViewController {
    
    var readChapterList :[FFReadChapterModel]!
    
    var bookName :String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
        setNavigationBackButtonDefault()
        let vc = FFTurnPageViewController()
        myTitle = bookName ?? ""
        view.backgroundColor = UIColor .white
        vc.readChapterList = readChapterList
        addChild(vc)
        view.insertSubview(vc.view, belowSubview: navigationBar)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(clickTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func clickTap() {
        navigationBar.isHidden = !navigationBar.isHidden
    }
}
