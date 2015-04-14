
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
//TODO six: Read the array saved in the previous file and print its space-delimited string representation here.
    
    @IBOutlet var textView: UITextView!
    var pathToFileFromVC5 : NSURL?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = pathToFileFromVC5 {
            if let items = NSArray(contentsOfURL: path) as? [String] {
                textView.text = "\(items)"
            }
        }
        // Do any additional setup after loading the view.
    }
}
