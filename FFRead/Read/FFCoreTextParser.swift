//
//  FFCoreTextParser.swift
//  FFRead
//
//  Created by feng on 2020/11/25.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation
import UIKit

class FFCoreTextParser: NSObject {
    class func parseContent(content:String!,chapterModel:FFReadChapterModel!) -> FFReadItemModel {
        
        let readmodel = FFReadItemModel()
        let textStyle = FFTextStyle()
        readmodel.chapterId = chapterModel.chapterId
        readmodel.bookId = chapterModel.bookId
        readmodel.bookName = chapterModel.bookName
        let rect = CGRect.init(x: 0, y: 0, width: FFReadConfig.share.textSize.width, height: FFReadConfig.share.textSize.height)
        let rangs = content.pageWithTextRect(textRect: rect, style: textStyle)
        
        for i in 0..<rangs.count {
            let pageModel = FFReadPageModel()
            pageModel.range = rangs[i]
            pageModel.content = content
            pageModel.pageIndex = i
            pageModel.chapterIndex = 0
            pageModel.width = FFReadConfig.share.textSize.width
            let pageStr = (content as NSString).substring(with: pageModel.range!)
            let height = pageStr.getPageHeight(width: pageModel.width, style: textStyle)
            pageModel.height = height
            let attrString = NSMutableAttributedString.init(string: (content as NSString).substring(with: pageModel.range))
            textStyle.addStyle(attrString: attrString, range: NSRange.init(location: 0, length: pageModel.range.length))
            
            let framesetter = CTFramesetterCreateWithAttributedString(attrString)
            let rect = CGRect.init(x: 0, y: 0, width: pageModel.width, height: height)
            let path = CGPath(rect: rect, transform: nil)
            let frameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, pageModel.range.length), path, nil)
            pageModel.frame = frameRef
            
            readmodel.pageModels.append(pageModel)
        }
        
        return readmodel
    }
}
