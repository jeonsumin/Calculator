//
//  RoundButton.swift
//  Calculator
//
//  Created by Terry on 2021/12/28.
//

import UIKit

/* storyboard 에서 inspect로 GUI를 통해 설정할 수 있도록 한다. 
단점은 매번 빌드를 한다. 
*/
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
