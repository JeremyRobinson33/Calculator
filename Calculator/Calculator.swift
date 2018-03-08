//
//  Calculator.swift
//  Calculator
//
//  Created by Jeremy  Robinson on 2/28/18.
//  Copyright © 2018 Jeremy  Robinson. All rights reserved.
//

import Foundation

class Calculator{
    
   
    @IBOutlet var outputLbl: UILabel!
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    enum Operation:String {
        case Add = "+"
        case Subtract = "-"
        case Divide = "/"
        case Multiply = "*"
        case Mod = "%"
        case Negate = "_"
        case NULL = "Null"
    }
    
    func operation(op: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber.endAt()
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
                    result = "\(Int(leftValue)! - ((Int(leftValue)! / Int(rightValue)!) * Int(rightValue)!))"
                }
                leftValue = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result.endAt()
            }
            currentOperation = op
        } else {
            leftValue = runningNumber.endAt()
            runningNumber = ""
            currentOperation = op
        }
    }
    
}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension String {
    //Terminate 7 positions after "."
    mutating func endAt() -> String{
        if self.contains(".") {
            let temp = self.index(of: ".")
            let temp2 = self.index(after: temp!)
            if (self.distance(from: self.startIndex, to: temp! )) == 9 { self.remove(at: self.index(self.startIndex, offsetBy: self.distance(from: self.startIndex, to: temp!)))
                print("working?")
            } else if(temp! != self.index(after: self.startIndex)) {
                let temp3 = self.index(self.startIndex, offsetBy: (self.distance(from: temp!, to: self.endIndex) ), limitedBy: self.endIndex)!
                self.removeSubrange(temp3...self.index(before: self.endIndex))
                print(temp3)
            } else {self.remove(at:temp2)}
        }
        return self
    }
}
