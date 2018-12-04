//
//  ViewController.swift
//  Calculator
//
//  Created by formation2 on 28/11/2018.
//  Copyright © 2018 formation2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorOnResultLabel: UILabel!
    @IBOutlet weak var dotButton: UIButton!
    
    var previousResult: Float = 0
    var previousOperation : String?
    var isResultDisplayed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func onDigitTaped(_ sender: UIButton) {
        
        guard let stringDigit = sender.titleLabel?.text else{
            return
        }
        
        if calculatorOnResultLabel.text == "0" || isResultDisplayed{
            calculatorOnResultLabel.text = stringDigit
            isResultDisplayed = false
        } else {
            calculatorOnResultLabel.text?.append(stringDigit)
        }
        
        if stringDigit == "." {
            dotButton.isEnabled = false
        }
    }
    
    @IBAction func onOperationTapped(_ sender: UIButton) {
        
        guard let stringDigit = sender.titleLabel?.text else{
            return
        }
        
        guard let stringResultLabel = calculatorOnResultLabel.text else{
            return
        }
        previousOperation = stringDigit
        previousResult = Float(stringResultLabel) ?? 0
        calculatorOnResultLabel.text = "0"
        dotButton.isEnabled = true
    }
    
    @IBAction func onEqualsTapped(_ sender: UIButton) {
        
        guard let operation = previousOperation else{
            return
        }
        
        guard let stringResultLabel = calculatorOnResultLabel.text else{
            return
        }
        
        let currentResult: Float? = Float(stringResultLabel)
        
        var result: Float = 0
        
        if operation == "+" {
            
            result = previousResult + (currentResult ?? 0)
            calculatorOnResultLabel.text = String(result)
            
        } else if operation == "-" {
            
            result = previousResult - (currentResult ?? 0)
            calculatorOnResultLabel.text = String(result)
            
        } else if operation == "*" {
            
            result = previousResult * (currentResult ?? 0)
            calculatorOnResultLabel.text = String(result)
            
        } else if operation == "/" {
            
            if currentResult != 0 {
                
                result = previousResult / (currentResult ?? 0)
                calculatorOnResultLabel.text = String(result)
                
            } else {
                 calculatorOnResultLabel.text = "ERREUR"
            }
        }
       
        isResultDisplayed = true
    }
    
}

