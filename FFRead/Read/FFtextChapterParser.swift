//
//  FFtextChapterParser.swift
//  swiftTest
//
//  Created by feng on 2020/9/24.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation

class FFtextChapterParser: NSObject {
    func parser(bookId:String!, content:String!) -> [FFReadChapterModel] {
        var chapterListArray: [FFReadChapterModel] = []
                
        let content = FFtextChapterParser .fliterString(content: content)
        
        let regular = "第[0-9一二三四五六七八九十百千]*[章回].*"
        var results:[NSTextCheckingResult] = []
        // 开始匹配
        do{
            let regularExpression:NSRegularExpression = try NSRegularExpression(pattern: regular, options: .caseInsensitive)
            
            results = regularExpression.matches(in: content, options: .reportCompletion, range: NSRange(location: 0, length: content.count))
            
        }catch{
            
            return chapterListArray
        }
        
        return chapterListArray
    }
    
    class func fliterString(content:String) -> String {
        var content = content.replacingOccurrences(of: "\r", with: "")
        
        content = content.replacingCharacters("\\s*\\n+\\s*", "\n" + "　　")
        return content
    }
}
