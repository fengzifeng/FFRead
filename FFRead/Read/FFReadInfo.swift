//
//  FFReadInfo.swift
//  FFRead
//
//  Created by feng on 2020/11/4.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation

class FFReadInfo: NSObject {
    
    static let share = FFReadInfo()
    
    let localRelevantFile: NSMutableDictionary = NSMutableDictionary.init()
    
    
    override init() {
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init()
    }
    
    
    
}
