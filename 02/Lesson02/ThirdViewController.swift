//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    
    @IBOutlet weak var numberToCheck: UITextField!
    
    @IBOutlet weak var labelField: UILabel!
    
    @IBAction func calculateButtonClicked(sender: AnyObject) {
        if (numberToCheck.text.toInt() == nil) {
            labelField.text = "that's not an integer"
        } else if numberToCheck.text.toInt()! % 2 == 0 {
            labelField.text = "the number is even"
        } else if numberToCheck.text.toInt()! % 2 != 0 {
            labelField.text = "the number is odd"
        }
    }
    
}
