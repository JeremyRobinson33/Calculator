//
//  ViewController.swift
//  Calculator
//
//  Created by Jeremy  Robinson on 2/4/18.
//  Copyright © 2018 Jeremy  Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var outputLbl: UILabel!
    var model = Calculator()
    var outputLbl: UILabel!
    var runningNumber:String = ""
    var leftValue:String = ""
    var rightValue:String = ""
    var result:String = ""
    var currentOperation:Calculator.Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runningNumber = model.runningNumber
        leftValue = model.leftValue
        rightValue = model.rightValue
        result = model.result
        currentOperation = model.currentOperation
        outputLbl = Calculator.outputLbl
        
        outputLbl.text = "0"
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
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
        if runningNumber.count <= 6 && (runningNumber.contains(".") == false) {
            runningNumber += "."
            outputLbl.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        model.operation(op: currentOperation)
    }
    
    @IBAction func plusPressed(_ sender: RoundButton) {
        model.operation(op: .Add)
    }
    
    @IBAction func minusPressed(_ sender: RoundButton) {
        model.operation(op: .Subtract)
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        model.operation(op: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        model.operation(op: .Divide)
    }
    
    @IBAction func negPressed(_ sender: RoundButton) {
        if runningNumber.count == 0 {
            outputLbl.text = "0"
        }else if runningNumber.contains("-") {
            runningNumber.remove(at: runningNumber.startIndex)
        } else {
           runningNumber.insert("-", at: runningNumber.startIndex)
        }
    }
    @IBAction func modPressed(_ sender: RoundButton) {
        model.operation(op: .Mod)
    }
    
    @IBAction func rootPressed(_ sender: RoundButton) {
        runningNumber = "\(sqrt(Double(runningNumber)!).rounded(toPlaces: 7))"
    }
}
