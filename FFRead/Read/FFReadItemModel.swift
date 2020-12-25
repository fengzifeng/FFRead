//
//  FFReadItemModel.swift
//  swiftTest
//
//  Created by feng on 2020/9/24.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation

class FFReadItemModel: NSObject {
    
    var bookId :String!
    
    var bookName :String!
    
    var pageModels :[FFReadPageModel]! = []
    
    var chapterId :String!
    
    var currentPage :Int!
    
    override init() {
        super.init()
        currentPage = 0
    }
    
    
}
