//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var currentNumber: String = ""
    private var isFinishedTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Could not convert text on screen to number")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorBrain()

    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        calculator.setNumber(displayValue)
        
        if let operation = sender.currentTitle {
            guard let result =  calculator.calculate(symbol: operation) else {
                fatalError("Operation is not supported")
            }
            displayValue = result
        }
        
        
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                
                displayLabel.text! += numValue
            }
//            currentNumber += numValue
            
        }
    
    }

}

