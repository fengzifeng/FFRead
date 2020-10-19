//
//  FFTurnPageLabel.swift
//  swiftTest
//
//  Created by feng on 2020/9/16.
//  Copyright © 2020 feng. All rights reserved.
//

import UIKit

class FFTurnPageLabel: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        context?.textMatrix = CGAffineTransform.identity
        context?.translateBy(x: 0, y: self.bounds.height)
        context?.scaleBy(x: 1, y: -1)
        
    }
}
