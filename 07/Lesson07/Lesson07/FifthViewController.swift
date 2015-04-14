//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
//TODO Five: Strings can be entered into this text box in a space-delimited fashion. They represent an array of strings. E.g. the entry "a b c" corresponds to array ["a", "b", "c"]. Save the array of strings that corresponds to the text in this text box to a file.
    
    @IBOutlet var textView: UITextView!
    
    var pathToFile : NSURL? {
        get {
            let filename = "textInVCFive.plist"
            
            
            let docDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as! NSURL
            
            let url = docDirectory.URLByAppendingPathComponent(filename)
            
            return url
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var text = split(textView.text) {$0 == " "}
        (text as NSArray).writeToURL(self.pathToFile!, atomically: true)
        
        if segue.identifier == "segueToSixth" {
            if let destinationVC = segue.destinationViewController as? SixthViewController {
                destinationVC.pathToFileFromVC5 = self.pathToFile
            }
        }
    }

}
