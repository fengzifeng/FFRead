//
//  FFTextStyle.swift
//  FFRead
//
//  Created by feng on 2020/11/27.
//  Copyright © 2020 feng. All rights reserved.
//

import UIKit

class FFTextStyle: NSObject,NSCoding {
    var font: UIFont = UIFont.systemFont(ofSize: 12)
    var textColor: UIColor = UIColor.black
    var titlefont: UIFont = UIFont.systemFont(ofSize: 18)
    var lineSpacing: Float = 5
    var paragraphSpacing: Float = 10
    var textAlignment = CTTextAlignment.left
    
    required init?(coder: NSCoder) {
        super.init()
        font = coder.decodeObject(forKey: "font") as! UIFont
        textColor = coder.decodeObject(forKey: "textColor") as! UIColor
        titlefont = coder.decodeObject(forKey: "titlefont") as! UIFont
        lineSpacing = coder.decodeFloat(forKey: "lineSpacing")
        paragraphSpacing = coder.decodeFloat(forKey: "paragraphSpacing")

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(font, forKey: "font")
        coder.encode(textColor, forKey: "textColor")
        coder.encode(titlefont, forKey: "titlefont")
        coder.encode(lineSpacing, forKey: "lineSpacing")
        coder.encode(paragraphSpacing, forKey: "paragraphSpacing")
    }
    
    func addStyle(attrString:NSMutableAttributedString, range:NSRange) -> Void {
        attrString.addAttribute(NSAttributedString.Key.font, value: self.font, range: range)
        
        let titleRange = (attrString.string as NSString).range(of:"\n")
        attrString.addAttribute(NSAttributedString.Key.font, value: self.titlefont, range: titleRange)
        
        
        let settings = [CTParagraphStyleSetting(spec: .alignment, valueSize: Int(self.textAlignment.rawValue), value:&textAlignment),CTParagraphStyleSetting(spec: .paragraphSpacing, valueSize: Int(self.paragraphSpacing), value: &paragraphSpacing),CTParagraphStyleSetting(spec: .maximumLineSpacing, valueSize: Int(self.lineSpacing), value: &lineSpacing)]

        let paragraphStyle = CTParagraphStyleCreate(settings, 3)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.textColor, range: range)
    }
    
    
    init(_ dict:Any? = nil) {
        
        super.init()
        
        if dict != nil { setValuesForKeys(dict as! [String : Any]) }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
}
