//
//  FFReadView.swift
//  FFRead
//
//  Created by feng on 2020/12/16.
//  Copyright © 2020 feng. All rights reserved.
//

import Foundation
import UIKit

class FFReadView: UIView {
    
    var pageModel: FFReadPageModel!
        
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
    }
    
    /// 绘制
    override func draw(_ rect: CGRect) {
        
        if (pageModel == nil) {return}
                
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.textMatrix = CGAffineTransform.identity
        ctx?.translateBy(x: 0, y: bounds.size.height);
        ctx?.scaleBy(x: 1.0, y: -1.0);
        let frame = pageModel.frame
        CTFrameDraw(frame!, ctx!);
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
}
