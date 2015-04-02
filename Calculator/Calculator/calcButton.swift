//
//  calcButton.swift
//  Calculator
//
//  Created by Katrina Voorhees on 3/27/15.
//  Copyright (c) 2015 katrinadv. All rights reserved.
//

import Foundation
import UIKit

class calcButton: UIButton {

    required init(coder aDecoder: (NSCoder!)) {
        
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.tintColor = UIColor.whiteColor()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
