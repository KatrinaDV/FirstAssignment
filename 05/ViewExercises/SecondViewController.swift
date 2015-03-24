//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        self.navigationController?.navigationBar.translucent = false

        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        var blueViewTL = UIView()
        var blueViewTR = UIView()
        var blueViewBL = UIView()
        var blueViewBR = UIView()
        let BVHeightWidth : CGFloat = 20
        
        for view in [blueViewTL, blueViewTR, blueViewBL, blueViewBR] {
            
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.backgroundColor = UIColor.blueColor()
            self.exerciseView.addSubview(view)
            
            let width = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: BVHeightWidth)
            let height = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: BVHeightWidth)
            self.exerciseView.addConstraints([width, height])
            
        }
        
        for view in [blueViewTL, blueViewTR] {
            
            let topRule = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
            
            self.exerciseView.addConstraint(topRule)
        }
        
        for view in [blueViewTL, blueViewBL] {
            
            let leftHandRule = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
            
            self.exerciseView.addConstraint(leftHandRule)
            
        }
        
        for view in [blueViewBR, blueViewBL] {
            
            let bottomRule = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -toolbarHeight)
            
            self.exerciseView.addConstraint(bottomRule)
        }
        
        for view in [blueViewBR, blueViewTR] {
            
            let rightHandRule = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Right, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Right, multiplier: 1, constant: 0)
            
            self.exerciseView.addConstraint(rightHandRule)
            
        }

    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
