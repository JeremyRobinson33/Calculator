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
        model.clear()
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        outputLbl.text = model.decimal()
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        model.operation(op: model.currentOperation)
        outputLbl.text = model.leftValue
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
        outputLbl.text = model.negative()
    }
    
    @IBAction func modPressed(_ sender: RoundButton) {
        model.operation(op: .Mod)
    }
    
    @IBAction func rootPressed(_ sender: RoundButton) {
        outputLbl.text = model.root()
    }
}
