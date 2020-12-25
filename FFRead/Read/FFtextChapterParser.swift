//
//  FFtextChapterParser.swift
//  swiftTest
//
//  Created by feng on 2020/9/24.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation

class FFtextChapterParser: NSObject {
    class func parser(path:String!,completion:((_ chapterListArray:[FFReadChapterModel]?) -> Void)!) {
        
        DispatchQueue.global().async {
            
            do {
                let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String
                let chapterListArray = parser(bookId: "111", content: content)
                
                DispatchQueue.main.async {
                    completion?(chapterListArray)
                }
                
            } catch {

            }
        }
    }

    class func parser(bookId:String!, content:String!) -> [FFReadChapterModel] {
        var chapterListArray: [FFReadChapterModel] = []
                
        let content = FFtextChapterParser.fliterString(content: content)
        
        let regular = "第[0-9一二三四五六七八九十百千]*[章回].*"
        var results:[NSTextCheckingResult] = []
        // 开始匹配
        do{
            let regularExpression:NSRegularExpression = try NSRegularExpression(pattern: regular, options: .caseInsensitive)
            
            results = regularExpression.matches(in: content, options: .reportCompletion, range: NSRange(location: 0, length: content.count))
            
        }catch{
            return chapterListArray
        }
        
        if !results.isEmpty {
            let count = results.count
            var lastRange:NSRange!
            var isPreface = false

            var i = 0
            
            for result: NSTextCheckingResult in results {
                let range = result.range
                let chapterModel = FFReadChapterModel()
                chapterModel.bookId = bookId
                chapterModel.num = NSNumber(value: i)
                chapterModel.chapterId = String.init(i)

                if i == 0 {
                    chapterModel.name = "前言"
                    chapterModel.content = (content as NSString).substring(with: NSMakeRange(0, range.location))
                    if !chapterModel.content.isEmpty {
                        chapterModel.isPreface = true
                        isPreface = true
                        chapterListArray.append(chapterModel)
                    } else {
                        continue
                    }
                } else {
                    chapterModel.name = (content as NSString).substring(with: lastRange)
                    chapterModel.content = (content as NSString).substring(with: NSMakeRange(lastRange.location + lastRange.length, range.location - lastRange.location - lastRange.length))
                    chapterListArray.append(chapterModel)
                }
                
                lastRange = range
                i+=1
            }
            
            let chapterModel = FFReadChapterModel()
            chapterModel.bookId = bookId
            chapterModel.num = NSNumber(value: (isPreface ? count+1 : count))
            chapterModel.chapterId = String.init(count)

            chapterModel.name = (content as NSString).substring(with: lastRange)
            chapterModel.content = (content as NSString).substring(with: NSMakeRange(lastRange.location + lastRange.length, content.count - lastRange.location - lastRange.length))
            chapterListArray.append(chapterModel)
        }
        
        return chapterListArray
    }
    
    class func fliterString(content:String) -> String {
        var content = content.replacingOccurrences(of: "\r", with: "")
        
        content = content.replacingCharacters("\\s*\\n+\\s*", "\n" + "　　")
        return content
    }
}
