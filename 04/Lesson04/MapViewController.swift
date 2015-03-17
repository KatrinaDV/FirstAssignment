//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        var notify = NSNotificationCenter.defaultCenter()
        
        notify.addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        notify.addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
    }
    
    var randoDictionary = [String: String]()
    
    @IBOutlet weak var keyTextField: UITextField!
    
    @IBOutlet weak var valueTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var keyList:[String] {
        get{
            return Array(randoDictionary.keys)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("thiscell") as UITableViewCell
        let myRowKey = keyList[indexPath.row] //dictionary key
        cell.textLabel!.text = myRowKey
        cell.detailTextLabel!.text = randoDictionary[myRowKey]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randoDictionary.count
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        if textField == valueTextField {
            randoDictionary[String(keyTextField.text)] = String(valueTextField.text)
            tableView.reloadData()
            valueTextField.resignFirstResponder()
        }
        if textField == keyTextField {
            keyTextField.resignFirstResponder()
        }
        return true
    }
    func keyboardWillShow(notification: NSNotification){
        keyTextField.backgroundColor = UIColor.blueColor()
        valueTextField.backgroundColor = UIColor.blueColor()
    }
    
    func keyboardWillHide(notificatin: NSNotification){
        keyTextField.backgroundColor = UIColor.redColor()
        valueTextField.backgroundColor = UIColor.redColor()
    }
    
}
