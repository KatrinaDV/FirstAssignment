//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FifthViewController: ExerciseViewController {
    
    var greenButton = UIButton()
    var greenButtonYOffset : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
        Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        var greenButton = UIButton()
        
        greenButton.backgroundColor = UIColor.greenColor()
        greenButton.layer.borderWidth = 1
        greenButton.layer.borderColor = UIColor.redColor().CGColor
        greenButton.setTitle("Tap Me!", forState: .Normal)
        greenButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        greenButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        greenButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 11)
        
        greenButton.addTarget(self, action: "greenButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        greenButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.exerciseView.addSubview(greenButton)
        
        let centerXRule = NSLayoutConstraint(item: greenButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        let centerYRule = NSLayoutConstraint(item: greenButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: greenButtonYOffset)
        
        
        let buttonWidthRule = NSLayoutConstraint(item: greenButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 50)
        let buttonHeightRule = NSLayoutConstraint(item: greenButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 50)

        self.exerciseView.addConstraints([centerXRule, centerYRule, buttonHeightRule, buttonWidthRule])
        self.exerciseView.layoutIfNeeded()
        
    }

    func greenButtonClicked(sender: UIButton!) {
        println("button pressed")
        
        UIView.animateWithDuration(0.5, animations: {
            sender.backgroundColor = UIColor.redColor()
            self.greenButtonYOffset = -20
            self.exerciseView.needsUpdateConstraints()
            sender.layoutIfNeeded()
            self.exerciseView.layoutIfNeeded()

            
            }, completion: { (finished) in
                UIView.animateWithDuration(0.5, animations: {
                    sender.backgroundColor = UIColor.greenColor()
                    self.greenButtonYOffset = 0
                    self.exerciseView.layoutIfNeeded()

                })
        })
    }

    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }

}
