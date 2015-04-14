//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
//TODO four: Read the file saved in the previous TODO, and make this text box print out the text of that file.
    
    var pathToFileFromVC3 : NSURL?
    
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = pathToFileFromVC3 {
            if let items = NSArray(contentsOfURL: path) as? [String] {
                textView.text = items[0]
            }
        }
        // Do any additional setup after loading the view.
    }
}
