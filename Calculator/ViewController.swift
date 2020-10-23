//
//  ViewController.swift
//  Calculator
//
//  Created by Elik on 21.10.2020.
//  Copyright © 2020 Elik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var fromScreenDouble: Double = 0
    var firstNumber: Double = 0
    var mathSign: Bool = false
    var operationTag: Int = 0
    
    @IBAction func actionButtons(_ sender: UIButton) {
        if resultLabel.text != "" && ( sender.tag == 11 || sender.tag == 12 ||
            sender.tag == 13 || sender.tag == 14) { // IS a math operation
            if resultLabel.text != "/" && resultLabel.text != "x" && resultLabel.text != "-" && resultLabel.text != "+" {
                firstNumber = Double(resultLabel.text!)!
            }
        
            if sender.tag == 11 { // /
                resultLabel.text = "/"
            }
            else if sender.tag == 12 { // *
                resultLabel.text = "x"
            }
            else if sender.tag == 13 { // -
                resultLabel.text = "-"
            }
            else if sender.tag == 14 { // +
                resultLabel.text = "+"
            }
            
            operationTag = sender.tag
            mathSign = true
        }
        else if sender.tag == 15 { // =
            if operationTag == 11 {
                resultLabel.text = String(firstNumber / fromScreenDouble)
            }
            else if operationTag == 12 {
                resultLabel.text = String(firstNumber * fromScreenDouble)
            }
            else if operationTag == 13 {
                resultLabel.text = String(firstNumber - fromScreenDouble)
            }
            else if operationTag == 14 {
                resultLabel.text = String(firstNumber + fromScreenDouble)
            }
        }
        else if sender.tag == 10 { // C
            resultLabel.text = ""
            (fromScreenDouble, firstNumber, operationTag) = (0, 0, 0)
        }
    }
    
    @IBAction func numberButtons(_ sender: UIButton) {
        if mathSign == true {
            resultLabel.text = String(sender.tag)
            mathSign = false
        }
        else {
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        
        fromScreenDouble = Double(resultLabel.text!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

