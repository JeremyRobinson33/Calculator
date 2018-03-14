//
//  Calculator.swift
//  Calculator
//
//  Created by Jeremy  Robinson on 2/28/18.
//  Copyright © 2018 Jeremy  Robinson. All rights reserved.
//

import Foundation

class Calculator{
    
    //initialize variables to handle everything
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var calculatedValue = ""
    var currentOperation:Operation = .NULL
    
    //an enum to easily put different cases into a function
    enum Operation:String {
        case Add = "+"
        case Subtract = "-"
        case Divide = "/"
        case Multiply = "*"
        case Mod = "%"
        case Negate = "_"
        case NULL = "Null"
    }
    
    //function to do most operations
    func operation(op: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\((Double(leftValue)! + Double(rightValue)!))"
                } else if currentOperation == .Subtract {
                    result = "\((Double(leftValue)! - Double(rightValue)!))"
                } else if currentOperation == .Multiply {
                    result = "\((Double(leftValue)! * Double(rightValue)!))"
                }else if currentOperation == .Divide {
                    result = "\((Double(leftValue)! / Double(rightValue)!))"
                }else if currentOperation == .Mod {
                    result = "\(Int(leftValue)! - (((Int(leftValue)!)/(Int(rightValue)!))*(Int(rightValue)!)))"
                }
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                leftValue = result
            }
            currentOperation = op
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    //function to make the current number negative
    func negative() -> String {
        if runningNumber.count == 0, leftValue.count != 0 {
            leftValue = "\(Double(leftValue)! * -1)"
            return leftValue
        } else if runningNumber.count != 0 {
            runningNumber = "\(Double(runningNumber)! * -1)"
            return runningNumber
        } else { return "0"}
    }
    
    //function to take the square root of the current number
    func root() -> String {
        if runningNumber.count != 0 {
            runningNumber = "\(sqrt(Double(runningNumber)!).rounded(toPlaces: 7))"
            return runningNumber
        } else if leftValue.count != 0 {
            leftValue = "\(sqrt(Double(leftValue)!).rounded(toPlaces: 7))"
            return leftValue
        } else {return "0"}
    }
    
    //function to handle decimals
    func decimal() -> String {
        if runningNumber.count == 0, leftValue.count == 0 {
            runningNumber += "0."
            return runningNumber
        }
        if leftValue.count <= 6 && (leftValue.contains(".") == false) && runningNumber.count == 0{
            leftValue += "."
            return leftValue
        } else if leftValue.contains(".") {
            return leftValue
        }
        if runningNumber.count <= 6 && (runningNumber.contains(".") == false) {
            runningNumber += "."
            return runningNumber
        } else if runningNumber.contains(".") {
            return runningNumber
        }
        else {return ""}
    }
    
    //function to handle clearing
    func clear() {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        calculatedValue = ""
        currentOperation = .NULL
    }
    
}


//extension to terminate after a given number of decimal places
extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

