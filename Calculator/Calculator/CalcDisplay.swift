//
//  CalcDisplay.swift
//  Calculator
//
//  Created by Katrina Voorhees on 3/30/15.
//  Copyright (c) 2015 katrinadv. All rights reserved.
//

import UIKit

class CalcDisplay: UILabel {
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)))
    }
    
    required init(coder aDecoder: (NSCoder!)) {
        
        super.init(coder: aDecoder)

        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.5
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
