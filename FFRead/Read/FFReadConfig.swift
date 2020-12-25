//
//  FFReadConfig.swift
//  FFRead
//
//  Created by feng on 2020/12/16.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation
import UIKit

class FFReadConfig: NSObject {
    static let share = FFReadConfig()
    
    let textSize: CGSize = CGSize.init(width: ScreenWidth - 40, height: ScreenHeigth - StateBarH - TabDiff)
    
    
    override init() {
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init()
    }
}
