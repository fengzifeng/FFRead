//
//  String+core.swift
//  FFRead
//
//  Created by feng on 2020/12/15.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func pageWithTextRect(textRect:CGRect, style:FFTextStyle) -> [NSRange] {
        
        let string = NSMutableAttributedString.init(string: self)
        style.addStyle(attrString: string, range: NSMakeRange(0, self.count))
        
        
        let framesetterRef = CTFramesetterCreateWithAttributedString(string)
        let path = CGPath(rect: textRect, transform: nil)
        var rangs:[NSRange] = []
        var range = CFRangeMake(0, 0)
        
        var tempIndex:NSInteger = 0
        
        repeat{
            
            let frame = CTFramesetterCreateFrame(framesetterRef, CFRangeMake(tempIndex, 0), path, nil)
            range = CTFrameGetVisibleStringRange(frame)
            rangs.append(NSMakeRange(tempIndex, range.length))
            tempIndex += range.length
            
        }while(range.location + range.length < string.length)
        
        return rangs
    }
    
    func getPageHeight(width:CGFloat, style:FFTextStyle) -> CGFloat {
        let attrString = NSMutableAttributedString.init(string: self)
        style.addStyle(attrString: attrString, range: NSMakeRange(0, attrString.length))
        let framesetter = CTFramesetterCreateWithAttributedString(attrString)
        let size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), nil)
        
        return size.height
        
    }
        
}
