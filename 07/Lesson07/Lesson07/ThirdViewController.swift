//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
//TODO three: Save the text in this text box to a flat file when 'next' is pressed.
    
    @IBOutlet var textView: UITextView!
    
    var pathToFile : NSURL? {
        get {
            let filename = "text.plist"
            
            
            let docDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as! NSURL
            
            let url = docDirectory.URLByAppendingPathComponent(filename)
            
            return url
        }
    }

    
//    @IBAction func nextPressed(sender: AnyObject) {
//        var text = textView.text
//        println(text)
//        (text as NSString).writeToURL(pathToFile!, atomically: true, encoding: UInt(), error: NSErrorPointer())
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = pathToFile {
            //this is requiring it to be not nil AND a string array
            if let items = NSArray(contentsOfURL: path) as? [String] {
            }
        }


        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var text = [textView.text]
        println(text)
        (text as NSArray).writeToURL(self.pathToFile!, atomically: true)
        
        if segue.identifier == "segueToFourth" {
            if let destinationVC = segue.destinationViewController as? FourthViewController {
                destinationVC.pathToFileFromVC3 = self.pathToFile
            }
        }
    }
}
