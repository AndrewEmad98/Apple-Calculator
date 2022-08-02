//
//  ViewController.swift
//  Calculator
//
//  Created by Andrew Emad on 01/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UILabel!
    var number1 : String? = "0"
    var number2 : String? = nil
    let calculator = Calculator()

    var operationIsJustTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func numberTapped(_ sender: UIButton) {
        if operationIsJustTapped {
            inputText.text = "0"
            operationIsJustTapped = false
        }
        var currentText = inputText.text ?? ""
        if currentText == "0" && sender.titleLabel?.text != "."{
            currentText.removeFirst()
        }
        currentText += sender.titleLabel?.text ?? ""
        
        inputText.text = currentText
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        inputText.text = "0"
        number1 = "0"
        number2 = nil
        calculator.operationSymbol = Addition()
    }
    
    @IBAction func changeSignTapped(_ sender: UIButton) {
        inputText.text = calculator.changeSign(num: inputText.text!)
    }
    
    
    @IBAction func percentageTapped(_ sender: UIButton) {
        guard let temp = Double(inputText.text!) else {return}
        let val = temp / 100
        inputText.text = String(val)
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
        number1 = inputText.text
        operationIsJustTapped = true
        guard let operation = sender.titleLabel?.text else {return}
        switch operation {
        case "+":
            calculator.operationSymbol = Addition()
        case "-":
            calculator.operationSymbol = Subtraction()
        case "÷":
            calculator.operationSymbol = Division()
        case "×":
            calculator.operationSymbol = Multiplication()
        default :
            calculator.operationSymbol = Addition()
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        number2 = inputText.text
        let result = calculator.applyOperation(num1: number1!, num2: number2!)
        inputText.text = result
        operationIsJustTapped = true
    }
}

