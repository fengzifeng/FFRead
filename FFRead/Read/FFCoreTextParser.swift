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
        var resContent :String = ""
        
        resContent = content.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        resContent = "　　" + resContent
        if chapterModel.name.count > 0 {
            resContent = chapterModel.name + "\n" + resContent
        }
        var placeHolder: unichar = 0xFFFC
        let placeHolderStr: NSString = NSString.init(characters: &placeHolder, length: 1)
        resContent.append(placeHolderStr as String)
        let rangs = resContent.pageWithTextRect(textRect: rect, style: textStyle, nameRange: NSRange.init(location: 0, length: chapterModel.name.count))
        
        for i in 0..<rangs.count {
            let pageModel = FFReadPageModel()
            pageModel.range = rangs[i]
            pageModel.content = resContent
            pageModel.pageIndex = i
            pageModel.chapterIndex = 0
            pageModel.width = FFReadConfig.share.textSize.width
            let pageStr = (resContent as NSString).substring(with: pageModel.range!)
            
            let attrString = NSMutableAttributedString.init(string: (resContent as NSString).substring(with: pageModel.range))
            if i == 0 {
                textStyle.addStyle(attrString: attrString, range: NSRange.init(location: 0, length: pageModel.range.length), nameRange: NSRange.init(location: 0, length: chapterModel.name.count))
                let height = pageStr.getPageHeight(width: pageModel.width, style: textStyle, nameRange: NSRange.init(location: 0, length: chapterModel.name.count))
                pageModel.height = height
            } else {
                textStyle.addStyle(attrString: attrString, range: NSRange.init(location: 0, length: pageModel.range.length), nameRange: nil)
                let height = pageStr.getPageHeight(width: pageModel.width, style: textStyle, nameRange: nil)
                pageModel.height = height
            }
            
            let framesetter = CTFramesetterCreateWithAttributedString(attrString)
            let rect = CGRect.init(x: 0, y: 0, width: pageModel.width, height: pageModel.height)
            let path = CGPath(rect: rect, transform: nil)
            let frameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, pageModel.range.length), path, nil)
            pageModel.frame = frameRef
            
            readmodel.pageModels.append(pageModel)
        }
        
        return readmodel
    }
}
