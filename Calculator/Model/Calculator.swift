//
//  Operation.swift
//  Calculator
//
//  Created by Andrew Emad on 01/08/2022.
//

import Foundation

protocol Opertionable {
    func calculateIntegerNumbers(num1 : Int , num2 : Int) -> Int
    func calculateDoubleNumbers(num1 : Double , num2 : Double) -> Double
}
class Addition : Opertionable {

    func calculateIntegerNumbers(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    func calculateDoubleNumbers(num1: Double, num2: Double) -> Double {
        return num1 + num2
    }
    
}
class Subtraction : Opertionable {

    func calculateIntegerNumbers(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    
    func calculateDoubleNumbers(num1: Double, num2: Double) -> Double {
        return num1 - num2
    }
    
}
class Multiplication : Opertionable {

    func calculateIntegerNumbers(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
    
    func calculateDoubleNumbers(num1: Double, num2: Double) -> Double {
        return num1 * num2
    }
    
}
class Division : Opertionable {

    func calculateIntegerNumbers(num1: Int, num2: Int) -> Int {
        return num1 / num2
    }
    
    func calculateDoubleNumbers(num1: Double, num2: Double) -> Double {
        return num1 / num2
    }
    
}


class Calculator {
    var operationSymbol : Opertionable = Addition()
    func applyOperation(num1:String,num2:String)->String{
        if operationSymbol is Division {
            if num2 == "0"{
                return "Not a Number"
            }
        }
        if isInteger(num1: num1, num2: num2){
            let result = operationSymbol.calculateIntegerNumbers(num1: Int(num1)!, num2: Int(num2)!)
            return String(result)
        }
        let result = operationSymbol.calculateDoubleNumbers(num1: Double(num1) ?? 0.0,num2: Double(num2) ?? 0.0)
        return result.removeZerosFromEnd()
    }
    private func isInteger(num1:String,num2:String)->Bool{
        if let _ = Int(num1),let _ = Int(num2){
            return true
        }
        return false
    }

    func changeSign(num:String)->String{
        if num == "0"{
            return "0"
        }
        var newValue : String = num
        if num.contains("-"){
            newValue.removeFirst()
            return newValue
        }
        return "-"+newValue
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 4
        return String(formatter.string(from: number) ?? "")
    }
}
