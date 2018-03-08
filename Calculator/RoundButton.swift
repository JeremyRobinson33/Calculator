//
//  RoundButton.swift
//  Calculator
//
//  Created by Jeremy  Robinson on 2/4/18.
//  Copyright © 2018 Jeremy  Robinson. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton: Bool = false {
        didSet{
            if roundButton {
                layer.cornerRadius = 50 / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = 50 / 2
        }
    }

}
