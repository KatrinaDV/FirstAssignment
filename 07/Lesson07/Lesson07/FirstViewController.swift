//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
//TODO one: Make this text view print the values of test_string and test_number, stored in NSUserDefaults
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = NSUserDefaults.standardUserDefaults().stringForKey("test_string")
        let number = NSUserDefaults.standardUserDefaults().stringForKey("test_number")
        textView.text = text! + " " + number!

    }
}