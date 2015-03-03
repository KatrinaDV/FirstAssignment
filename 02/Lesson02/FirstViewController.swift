//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var label: UILabel!
    var textToPrint: String = ""

//TODO one function
    
    func helloWorld(){
        textToPrint = "hello world\n"
    }
    
    func greeting(){
        if name.text.isEmpty || age.text.isEmpty{
            textToPrint += "Enter your Name and Age"
        } else {
        textToPrint += "Hello \(name.text), you are \(age.text) years old!\n"
        }
    }
    
    func ageChecker(){
        if age.text.toInt() >= 20 {
            textToPrint += "You can drink\n"
        } else if age.text.toInt() >= 18 {
            textToPrint += "you can vote\n"
        } else if age.text.toInt() >= 16 {
            textToPrint += "You can drive\n"
        }
    }
    
    func ageChecker2(){
        if  age.text.toInt() >= 16 && age.text.toInt() < 18 {
            textToPrint += "you can drive"
        } else if age.text.toInt() >= 18 && age.text.toInt() < 21 {
            textToPrint += "You can drive and vote"
        } else if age.text.toInt() >= 21 {
            textToPrint += "you can drive, vote and drink (but not at the same time!)"
        }
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        //textToPrint = "hello world\n"
        helloWorld()
        greeting()
        ageChecker()
        ageChecker2()
        label.text = textToPrint
    }

//TODO two function
    @IBAction func buttonClicked2(sender: AnyObject) {
        //println("Hello \(name.text), you are \(age.text) years old!")
    }
    
//TODO three function
    @IBAction func ButtonClicked3(sender: AnyObject) {
      /*  if age.text.toInt() >= 20 {
            println("You can drink")
        } else if age.text.toInt() >= 18 {
            println("you can vote")
        } else if age.text.toInt() >= 16 {
            println("You can drive")
        }*/
    }
    
//TODO four function
    
    @IBAction func buttonClicked4(sender: AnyObject) {
      /*  if  age.text.toInt() > 16 && age.text.toInt() < 18 {
            println("you can drive")
        } else if age.text.toInt() > 18 && age.text.toInt() < 21 {
            println("You can drive and vote")
        } else if age.text.toInt() > 21 {
            println("you can drive, vote and drink (but not at the same time!")
        }*/
    }
}
