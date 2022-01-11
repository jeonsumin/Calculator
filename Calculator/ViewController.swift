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
    
    //MARK: - Properties
    @IBOutlet weak var numberOutputLb: UILabel!
    
    var displayNumber = ""  // 버튼을 누를때마다 표시되는 숫자
    var firstOperand = ""   // 첫번째 피연산자
    var secondOperend = ""  // 두번째 피연산자
    var result = ""         // 계산의 결과 값
    var currentOperation: Operation = .unknown  //현재 계산기에 어떤연산자가 입력되어있는지 연산자의 값을 표시
    
    //MARK: - LiceCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func operation(_ operation: Operation){
        if self.currentOperation != .unknown {
            if !displayNumber.isEmpty {
                secondOperend = displayNumber
                displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperend) else { return }
                // Optrion Enum에 case에 따라 연산
                switch self.currentOperation {
                case .Add:
                    result = "\(firstOperand + secondOperand)"
                case .subtract:
                    result = "\(firstOperand - secondOperand)"
                case .Divied:
                    result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    result = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.numberOutputLb.text = self.result
            }
            currentOperation = operation
        }else {
            self.firstOperand = displayNumber
            currentOperation = operation
            displayNumber = ""
        }
    }
    
    //MARK: - IBAction
    // 숫자패드
    @IBAction func tapNumberBtn(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if displayNumber.count < 9 {
            displayNumber += numberValue
            numberOutputLb.text = displayNumber
        }
    }
    
    // AC 초기화
    @IBAction func tapClearBtn(_ sender: UIButton) {
        displayNumber = ""
        firstOperand = ""
        secondOperend = ""
        result = ""
        currentOperation = .unknown
        numberOutputLb.text = "0"
    }
    // .
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if displayNumber.count < 8, !displayNumber.contains(".") {
            displayNumber += displayNumber.isEmpty ? "0." : "."
            numberOutputLb.text = displayNumber
        }
    }
    
    // 나누기 버튼
    @IBAction func tapDivideBtn(_ sender: UIButton) {
        // operation함수를 재사용하여 해당 버튼의 연산값을 보내어 연산값에 따라 operation함수에서 계산 
        operation(.Divied)
    }
    
    // 곱하기버튼
    @IBAction func tapMultiplyBtn(_ sender: UIButton) {
        // operation함수를 재사용하여 해당 버튼의 연산값을 보내어 연산값에 따라 operation함수에서 계산 
        operation(.Multiply)
    }
    
    //빼기 버튼
    @IBAction func tapSubtractBtn(_ sender: UIButton) {
        // operation함수를 재사용하여 해당 버튼의 연산값을 보내어 연산값에 따라 operation함수에서 계산 
        operation(.subtract)
    }
    
    // 더하기 버튼
    @IBAction func tapAddBtn(_ sender: UIButton) {
        // operation함수를 재사용하여 해당 버튼의 연산값을 보내어 연산값에 따라 operation함수에서 계산 
        operation(.Add)
    }
    
    // = 버튼
    @IBAction func tapEqualBtn(_ sender: UIButton) {
        // operation함수를 재사용하여 해당 버튼의 연산값을 보내어 연산값에 따라 operation함수에서 계산 
        operation(self.currentOperation)
    }
    
    
    
}

