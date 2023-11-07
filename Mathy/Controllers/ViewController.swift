//
//  ViewController.swift
//  Mathy
//
//  Created by Deniz Dilbilir on 31/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
  private var finishedtyping: Bool = true
    
    private var displayValue: Double {
        get {
            guard let myNumber = Double(resultLabel.text!) else {
                 fatalError("can't convert resultLabel.text to a double value")
             }
            return myNumber
        } set {
            if newValue == floor(newValue) {
                 resultLabel.text = String(format: "%.0f", newValue)
             } else {
                 resultLabel.text = String(newValue)
             }
         }
     }

    
    private var myCalculator = MathyLogic()
    
    @IBAction func mathButtonsPressed(_ sender: UIButton) {
        
        finishedtyping = true
        
        myCalculator.setNumber(displayValue)
    
        if let mathyMethod = sender.currentTitle {
            
            if let result = myCalculator.calculate(symbol: mathyMethod) {
                
               displayValue = result
            }
           
        }
        
    }
    
    @IBAction func numbersPressed(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            
            if finishedtyping {
                resultLabel.text = numberValue
                finishedtyping = false
            } else {
                
                if numberValue == "." {
                    
                    let Int = floor(displayValue) == displayValue
                    if !Int {
                        return
                    }
                       
                    
                }
                
                resultLabel.text = resultLabel.text! + numberValue
            }
        }
    }
    
}
