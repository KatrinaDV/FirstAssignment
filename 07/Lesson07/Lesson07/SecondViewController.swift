//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
//TODO two: Make this text view print the values of the string and slider value stored in the settings bundle of the app.
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateText()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateText", name: NSUserDefaultsDidChangeNotification, object: nil)

    }
    
    func updateText(){
        if let sliderValue = NSUserDefaults.standardUserDefaults().stringForKey("settings_slider") {
            textView.text = sliderValue
            if let string = NSUserDefaults.standardUserDefaults().stringForKey("settings_name") {
            textView.text = string + " " + sliderValue
            }
        } else if let string = NSUserDefaults.standardUserDefaults().stringForKey("settings_name") {
            textView.text = string
        }
    }
}
