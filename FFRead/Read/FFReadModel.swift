//
//  FFReadModel.swift
//  FFRead
//
//  Created by feng on 2020/12/29.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation
class FFReadModel: NSObject {
    var currentPage :Int!
    var chapterIndex: Int!
    var cacheIndex: Int!
    var readItemModel: FFReadItemModel!

    
    override init() {
        super.init()
        currentPage = 0
        chapterIndex = 0
        cacheIndex = 0
    }

    func copyModel() ->FFReadModel {
        let model = FFReadModel()
        model.currentPage = currentPage
        model.chapterIndex = chapterIndex
        model.cacheIndex = cacheIndex
        model.readItemModel = readItemModel

        return model
    }
}
