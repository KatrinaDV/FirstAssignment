//
//  FirstViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FirstViewController: ExerciseViewController {
    
    let redBlackBoxHeight :CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a red box (10px tall, the width of the screen) with a black border on the very top of the screen below the nav bar,
        and a black box with a red border on the very bottom of the screen (same dimensions), above the toolbar.
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        self.navigationController?.navigationBar.translucent = false

        
        var redBox = UIView()
        redBox.backgroundColor = UIColor.redColor()
        redBox.layer.borderWidth = 1
        redBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.exerciseView.addSubview(redBox)

        
        var blackBox = UIView()
        blackBox.backgroundColor = UIColor.blackColor()
        blackBox.layer.borderWidth = 1
        blackBox.layer.borderColor = UIColor.redColor().CGColor
        blackBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.exerciseView.addSubview(blackBox)
        
        
        let topRule = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let bottomRule = NSLayoutConstraint(item: blackBox, attribute: .Bottom, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Bottom, multiplier: 1, constant: -toolbarHeight)
        
        self.exerciseView.addConstraints([topRule, bottomRule])
        
        
        for view in [redBox, blackBox] {
            let width = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
            let center = NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: self.exerciseView, attribute: .CenterX, multiplier: 1, constant: 0)
            let height = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: redBlackBoxHeight)
            self.exerciseView.addConstraints([width, center, height])
        
        }
        self.exerciseView.layoutIfNeeded()
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    func next() {
        self.performSegueWithIdentifier("two", sender: nil)
    }
}
