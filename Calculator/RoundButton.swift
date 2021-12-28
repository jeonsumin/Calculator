//
//  RoundButton.swift
//  Calculator
//
//  Created by Terry on 2021/12/28.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
 @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
