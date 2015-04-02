//
//  ViewController.swift
//  Calculator
//
//  Created by Katrina Voorhees on 3/20/15.
//  Copyright (c) 2015 katrinadv. All rights reserved.
//

import UIKit

//math functions
func addition (a: Double, b: Double) -> Double {
    var total = a + b
    return total
}
func subtraction (a: Double, b: Double) -> Double {
    var total = a - b
    return total
}
func multipliction (a: Double, b: Double) -> Double {
    var total = a * b
    return total
}
func division (a: Double, b: Double) -> Double {
    var total = a / b
    return total
}
func percentage (a: Double) -> Double {
    var percent = a / 100
    return percent
}
func changeNegPos (a: Double) -> Double {
    var changed = a * (-1)
    return changed
}

let basicOps : [String: ((Double, Double) -> Double)] = ["+" : addition, "-" : subtraction, "X" : multipliction, "/" : division]

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet var ACButton: calcButton!
    
    var total : Double = 0.0
    var numberToDisplay : String = ""
    var numbers : [Double] = []
    var operators : [String] = []
    
    @IBAction func numberPressed(sender: UIButton) {
        if let text = sender.titleLabel?.text {
            if calculatorDisplay.text == "0" {
                numberToDisplay = text
            } else {
            numberToDisplay = numberToDisplay + text
            }
            total = (numberToDisplay as NSString).doubleValue
            updateCalcDisplay()
        }
    }
        
    func decimalTest() -> Bool {
        for i in numberToDisplay {
            if i == "." {
                return true
            }
        }
        return false
    }
    
    @IBAction func decimalPressed(sender: AnyObject) {
        if decimalTest() == false {
                numberToDisplay = numberToDisplay + "."
            }
        total = (numberToDisplay as NSString).doubleValue
        updateCalcDisplay()

    }
    
    @IBAction func changePosNegPressed(sender: AnyObject) {
        total = total * -1
        numberToDisplay = "\(total)"
        updateCalcDisplay()
    }
    
    @IBAction func percentPressed(sender: AnyObject) {
        total = total / 100
        numberToDisplay = "\(total)"
        updateCalcDisplay()
    }
    

    @IBAction func CPressed(sender: AnyObject) {
        numberToDisplay = ""
        total = 0
        updateCalcDisplay()
    }
    
    @IBAction func ACPressed(sender: AnyObject) {
            numbers.removeAll()
            operators.removeAll()
            numberToDisplay = ""
            total = 0
            updateCalcDisplay()
    }
    
    func updateCalcDisplay(){
        if total % 1 == 0 {
            calculatorDisplay.text = "\(Int(total))"
        } else {
            calculatorDisplay.text = "\(total)"
        }
    }

    @IBAction func operatorPressed(sender: UIButton){
        if let newOp : String = sender.titleLabel?.text! {
            if numberToDisplay != "" && !numbers.isEmpty {
                var stackOp = operators.last
                if !((stackOp == "+" || stackOp == "-") && (newOp == "*" || newOp == "/")) {
                    var oper = basicOps[operators.removeLast()]
                    total = oper!(numbers.removeLast(), total)
                    equals()
                }
            }
            operators.append(newOp)
            numbers.append(total)
            numberToDisplay = ""
            updateCalcDisplay()
        }
    }

    func equals() {
        if numberToDisplay == "" {
            return
        }
        if !numbers.isEmpty {
            var oper = basicOps[operators.removeLast()]
            total = oper!(numbers.removeLast(), total)
            if !operators.isEmpty {
                equals()
            }
        }
        updateCalcDisplay()
        numberToDisplay = ""
    }
    
    @IBAction func equalPressed(sender: UIButton) {
        equals()
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

