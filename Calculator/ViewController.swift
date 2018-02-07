//
//  ViewController.swift
//  Calculator
//
//  Created by Jeremy  Robinson on 2/4/18.
//  Copyright © 2018 Jeremy  Robinson. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Mod = "%"
    case Negate = "_"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLbl.text = "0"
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLbl.text = runningNumber
        }
    }
    
    @IBAction func acPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count == 0 {
            runningNumber += "0."
        }
        if runningNumber.count <= 7 && (runningNumber.contains(".") == false) {
            runningNumber += "."
            outputLbl.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(op: currentOperation)
    }
    
    @IBAction func plusPressed(_ sender: RoundButton) {
        operation(op: .Add)
    }
    
    @IBAction func minusPressed(_ sender: RoundButton) {
        operation(op: .Subtract)
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(op: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(op: .Divide)
    }
    
    @IBAction func negPressed(_ sender: RoundButton) {
        if runningNumber.count == 0 {
            outputLbl.text = "0"
        }else if runningNumber.contains("-") {
            runningNumber.remove(at: runningNumber.startIndex)
            outputLbl.text = runningNumber
        } else {
           runningNumber.insert("-", at: runningNumber.startIndex)
            outputLbl.text = runningNumber
        }
    }
    @IBAction func modPressed(_ sender: RoundButton) {
        operation(op: .Mod)
    }
    func operation(op: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }else if currentOperation == .Mod {
                    result = "\(Int(leftValue)! - ((Int(leftValue)! / Int(rightValue)!) * Int(rightValue)!))"
                }
                leftValue = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = op
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
}

