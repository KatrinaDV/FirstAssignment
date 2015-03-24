//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController, UIScrollViewDelegate {
    
    let blueBoxHeight : CGFloat = 20
    let purpleLabelHeight : CGFloat = 1000
    let redBoxHeight : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        self.navigationController?.navigationBar.translucent = false
        /* TODO:
        Build a scroll view that takes up the entire screen. 
        
        In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen, a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.
        
        Use Autolayout.

        
        Your view should be in self.exerciseView, not self.view.
        */
        var scrollView = UIScrollView()
        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.frame.size = self.exerciseView.frame.size
        
        
        
        let scrollViewHeight = blueBoxHeight + purpleLabelHeight + redBoxHeight
        let scrollViewWidth = self.exerciseView.frame.width
        scrollView.contentSize = CGSizeMake(scrollViewWidth, scrollViewHeight)
        
        self.exerciseView.addSubview(scrollView)
        let widthScroll = NSLayoutConstraint(item: scrollView, attribute: .Width, relatedBy: .Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let Top = NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Top, multiplier: 1, constant: 0)
        let Bottom = NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Bottom, multiplier: 1, constant: 0)
        let Left = NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Left, multiplier: 1, constant: 0)
        let Right = NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Right, multiplier: 1, constant: 0)
        self.exerciseView.addConstraints([widthScroll, Top, Bottom, Left, Right])

        
        var holderView = UIView()
        holderView.backgroundColor = UIColor.redColor()
        holderView.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(holderView)
        
        let TopCV = NSLayoutConstraint(item: holderView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let LeftCV = NSLayoutConstraint(item: holderView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        let RightCV = NSLayoutConstraint(item: holderView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let BottomCV = NSLayoutConstraint(item: holderView, attribute: .Bottom, relatedBy: .Equal, toItem: scrollView, attribute: .Bottom, multiplier: 1, constant: 0)
        let HeightCV = NSLayoutConstraint(item: holderView, attribute: NSLayoutAttribute.Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: scrollViewHeight)
        scrollView.addConstraints([TopCV, LeftCV, RightCV])

        
//        var blueBox = UIView()
//        blueBox.setTranslatesAutoresizingMaskIntoConstraints(false)
//        blueBox.backgroundColor = UIColor.blueColor()
//        containerView.addSubview(blueBox)
//        
//        let topBlueBoxRule = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
//        let blueBoxHeightRule = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: blueBoxHeight)
//        let margin : CGFloat = 10
//        let leftMarginRule = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1, constant: 0)
//        let rightMarginRule = NSLayoutConstraint(item: blueBox, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1, constant: 0)
//
//        var purpleLabel = UILabel()
//        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
//        purpleLabel.backgroundColor = UIColor.purpleColor()
//        purpleLabel.text = "purple"
//        purpleLabel.textColor = UIColor.whiteColor()
//        purpleLabel.frame.size.height = purpleLabelHeight
//        containerView.addSubview(purpleLabel)
//        
//        let labelWidthRule = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: containerView, attribute: .Width, multiplier: 1, constant: 0)
//        
////        var redBox = UIView()
////        redBox.setTranslatesAutoresizingMaskIntoConstraints(false)
////        redBox.backgroundColor = UIColor.redColor()
////        containerView.addSubview(redBox)
////        
////        let bottomRedBoxRule = NSLayoutConstraint(item: redBox, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1, constant: 0)
////        let redBoxHeightRule = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: redBoxHeight)
//        
//        containerView.addConstraints([topBlueBoxRule, blueBoxHeightRule, labelWidthRule, leftMarginRule, rightMarginRule])
        
//        for view in [redBox, blueBox] {
//            let margin : CGFloat = 10
//            let leftMarginRule = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1, constant: margin)
//            let rightMarginRule = NSLayoutConstraint(item: view, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1, constant: -margin)
//            containerView.addConstraints([leftMarginRule, rightMarginRule])
//        }
        
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }

}
