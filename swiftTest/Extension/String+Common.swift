//
//  NSString+Common.swift
//  swiftTest
//
//  Created by feng on 2019/10/30.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

extension String {
    
    func stringWidthWith(font: UIFont, height: CGFloat) -> CGFloat {
        if self.count == 0  {
            return 0
        }
        
        var size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: height)
        
        let paragraph = NSMutableParagraphStyle.init()
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
        size = self.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font, NSAttributedString.Key.paragraphStyle:paragraph], context: nil).size
        
        return size.width;
    }
    
    func stringHeightWith(font: UIFont, width: CGFloat) -> CGFloat {
        if self.count == 0  {
            return 0
        }
        
        var size = CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let paragraph = NSMutableParagraphStyle.init()
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
        size = self.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font, NSAttributedString.Key.paragraphStyle:paragraph], context: nil).size
        
        return size.height;
    }
    
    /// 正则替换字符
    func replacingCharacters(_ pattern:String, _ template:String) ->String {
        
        do {
            let regularExpression = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            
            return regularExpression.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, self.count), withTemplate: template)
            
        } catch {return self}
    }
}
