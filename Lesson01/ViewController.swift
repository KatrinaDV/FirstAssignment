//
//  ViewController.swift
//  Lesson01
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func loginPressed(sender: AnyObject) {
        if userName.text.isEmpty || password.text.isEmpty {
            errorMessage.text = "Missing UserName or Password"
        } else {
            self.performSegueWithIdentifier("logmein", sender: self)
        }
    }
    
    override func loadView() {
        super.loadView()
        
        let field = UITextField()
        self.view.addSubview(field)
        
        
    }

}

