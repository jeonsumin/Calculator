//
//  ViewController.swift
//  Calculator
//
//  Created by Terry on 2021/12/28.
//

import UIKit

enum Operation {
    case Add
    case subtract
    case Divied
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var numberOutputLb: UILabel!
    
    var displayNumber = ""  // 버튼을 누를때마다 표시되는 숫자
    var firstOperand = ""   // 첫번째 피연산자
    var secondOperend = ""  // 두번째 피연산자
    var result = ""         // 계산의 결과 값
    var currentOperation: Operation = .unknown  //현재 계산기에 어떤연산자가 입력되어있는지 연산자의 값을 표시
    
    //MARK: LiceCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Action Function
    @IBAction func tapNumberBtn(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if displayNumber.count < 9 {
           displayNumber += numberValue
            numberOutputLb.text = displayNumber
        }
    }
    
    @IBAction func tapClearBtn(_ sender: UIButton) {
        displayNumber = ""
        firstOperand = ""
        secondOperend = ""
        result = ""
        currentOperation = .unknown
        numberOutputLb.text = "0"
    }
    
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if displayNumber.count < 8, !displayNumber.contains(".") {
            displayNumber += displayNumber.isEmpty ? "0." : "."
            numberOutputLb.text = displayNumber
        }
    }
    
    @IBAction func tapDivideBtn(_ sender: UIButton) {
    }
    
    @IBAction func tapMultiplyBtn(_ sender: UIButton) {
    }
    
    @IBAction func tapSubtractBtn(_ sender: UIButton) {
    }
    
    @IBAction func tapAddBtn(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualBtn(_ sender: UIButton) {
    }
    
}

