//
//  CalculatorViewController.swift
//  CurrencyCalculatorApp
//
//  Created by Joseph T. Furmanowski on 9/12/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var dollarAmount: UITextField!
    @IBOutlet weak var currencyAmount: UITextField!
    @IBOutlet weak var currencySymbol: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    
    let myCalculator = Calculator.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dollarAmount.text = "0.00"
        currencyAmount.text = "0.00"
        currencySymbol.text = myCalculator.getConversionSymbol()
        convertButton.setTitle("$ -> " + myCalculator.getConversionSymbol(), for: .normal)
    }
    
    
    @IBAction func convertToCurrency(_ sender: UIButton) {
        var currency = 0.00
        if let dollar = Double (dollarAmount.text!) {
            currency = myCalculator.dollarToCurrency(dollar: dollar)
        }
        currencyAmount.text = String (format: "%.2f", currency)
    }
    
    
    
}
