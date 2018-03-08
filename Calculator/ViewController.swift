//
//  ViewController.swift
//  Calculator
//
//  Created by Jeremy  Robinson on 2/4/18.
//  Copyright © 2018 Jeremy  Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    var model = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLbl.text = "0"
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if model.runningNumber.count <= 7 {
            model.runningNumber += "\(sender.tag)"
            outputLbl.text = model.runningNumber
        }
    }
    
    @IBAction func acPressed(_ sender: RoundButton) {
        model.runningNumber = ""
        model.leftValue = ""
        model.rightValue = ""
        model.result = ""
        model.currentOperation = .NULL
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if model.runningNumber.count == 0 {
            model.runningNumber += "0."
        }
        if model.runningNumber.count <= 6 && (model.runningNumber.contains(".") == false) {
            model.runningNumber += "."
            outputLbl.text = model.runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        model.operation(op: model.currentOperation)
        outputLbl.text = model.result
    }
    
    @IBAction func plusPressed(_ sender: RoundButton) {
        model.operation(op: .Add)
        outputLbl.text = model.result
    }
    
    @IBAction func minusPressed(_ sender: RoundButton) {
        model.operation(op: .Subtract)
        outputLbl.text = model.result
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        model.operation(op: .Multiply)
        outputLbl.text = model.result
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        model.operation(op: .Divide)
        outputLbl.text = model.result
    }
    
    @IBAction func negPressed(_ sender: RoundButton) {
        if model.runningNumber.count == 0 {
            outputLbl.text = "0"
        }else if model.runningNumber.contains("-") {
            model.runningNumber.remove(at: model.runningNumber.startIndex)
        } else {
           model.runningNumber.insert("-", at: model.runningNumber.startIndex)
        }
    }
    @IBAction func modPressed(_ sender: RoundButton) {
        model.operation(op: .Mod)
        outputLbl.text = model.result
    }
    
    @IBAction func rootPressed(_ sender: RoundButton) {
        model.runningNumber = "\(sqrt(Double(model.runningNumber)!).rounded(toPlaces: 7))"
    }
}
