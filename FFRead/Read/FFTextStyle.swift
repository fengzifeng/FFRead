//
//  FFTextStyle.swift
//  FFRead
//
//  Created by feng on 2020/11/27.
//  Copyright © 2020 feng. All rights reserved.
//

import UIKit

class FFTextStyle: NSObject,NSCoding {
    var font: UIFont = UIFont.systemFont(ofSize: 16)
    var textColor: UIColor = UIColor.black
    var titlefont: UIFont = UIFont.systemFont(ofSize: 20)
    var lineSpacing: CGFloat = 5
    var paragraphSpacing: CGFloat = 8
    var textAlignment = NSTextAlignment.justified
    
    required init?(coder: NSCoder) {
        super.init()
        font = coder.decodeObject(forKey: "font") as! UIFont
        textColor = coder.decodeObject(forKey: "textColor") as! UIColor
        titlefont = coder.decodeObject(forKey: "titlefont") as! UIFont
        lineSpacing = CGFloat(coder.decodeFloat(forKey: "lineSpacing"))
        paragraphSpacing = CGFloat(coder.decodeFloat(forKey: "paragraphSpacing"))

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(font, forKey: "font")
        coder.encode(textColor, forKey: "textColor")
        coder.encode(titlefont, forKey: "titlefont")
        coder.encode(lineSpacing, forKey: "lineSpacing")
        coder.encode(paragraphSpacing, forKey: "paragraphSpacing")
    }
    
    func addStyle(attrString:NSMutableAttributedString, range:NSRange, nameRange:NSRange?) -> Void {
        attrString.addAttribute(NSAttributedString.Key.font, value: self.font, range: range)

        if (nameRange != nil) {
            attrString.addAttribute(NSAttributedString.Key.font, value: self.titlefont, range: nameRange!)
        }
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        style.paragraphSpacing = paragraphSpacing
        style.alignment = textAlignment
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: range)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.textColor, range: range)

    }
    
    
    init(_ dict:Any? = nil) {
        
        super.init()
        
        if dict != nil { setValuesForKeys(dict as! [String : Any]) }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
}
