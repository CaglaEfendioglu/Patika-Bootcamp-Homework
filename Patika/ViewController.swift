//
//  ViewController.swift
//  Patika
//
//  Created by Cagla Efendioglu on 1.10.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Views
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    //MARK: Properties
    
    var labelNumber = ""
    var textNumber = ""
    var numberResult = 0.0
    var calculatorOperator = ""
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Private Func
    
    private func factorialComputation(value: Int) -> Int {
        var sonuc = 1
        var numberData = value
        
        while (numberData>0){
           sonuc *= numberData
        
            numberData -= 1
       }
        
        return sonuc
    }
    
    private func labelTextumber(number: String) {
        if secondLabel.text == ""  || secondLabel.text == nil {
            textNumber += labelNumber
            firstLabel.text = textNumber
        }else{
            if thirdLabel.text == "" || thirdLabel.text == nil {
                textNumber = labelNumber
                thirdLabel.text = textNumber
            }else{
                textNumber += labelNumber
                thirdLabel.text = textNumber
            }
        }
    }
    
    private func calculatorOperatorText(operator: String) {
        if firstLabel.text == "" || firstLabel.text == nil {
            if calculatorOperator == "+" || calculatorOperator == "-" {
            firstLabel.text = calculatorOperator
            }
        }else{
            secondLabel.text = calculatorOperator
        }
    }
    
    //MARK: IBAction
    
    @IBAction func buttonZero(_ sender: Any) {
        labelNumber = "0"
       labelTextumber(number: labelNumber)
    }

    @IBAction func buttonOne(_ sender: Any) {
        labelNumber = "1"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        labelNumber = "2"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        labelNumber = "3"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        labelNumber = "4"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonFive(_ sender: Any) {
        labelNumber = "5"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonSix(_ sender: Any) {
        labelNumber = "6"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonSeven(_ sender: Any) {
        labelNumber = "7"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonEight(_ sender: Any) {
        labelNumber = "8"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonNine(_ sender: Any) {
        labelNumber = "9"
        labelTextumber(number: labelNumber)
    }
    
    @IBAction func buttonEqual(_ sender: Any) {
        guard let numberFirst = Double(firstLabel.text ?? "") else { return }
        var numberSecond = 0.0
        if calculatorOperator != "x²" && calculatorOperator != "√" && calculatorOperator != "x!" {
            guard let number = Double(thirdLabel.text ?? "") else { return }
            numberSecond = number
        }
        
        firstLabel.text = "0"
        secondLabel.text?.removeAll()
        thirdLabel.text?.removeAll()
        textNumber.removeAll()
        
        switch calculatorOperator {
        case "+":
            numberResult = numberFirst + numberSecond
            let resultInt = Int(numberResult)
            firstLabel.text = "\(resultInt)"
        case "-":
            numberResult =  numberFirst - numberSecond
            let resultInt = Int(numberResult)
            firstLabel.text = "\(resultInt)"
        case "X":
            numberResult = numberFirst * numberSecond
            let resultInt = Int(numberResult)
            firstLabel.text = "\(resultInt)"
        case "÷":
            if numberFirst == 0 {
                print("Error")
            }else{
                numberResult = numberFirst / numberSecond
                let resultInt = Int(numberResult)
                firstLabel.text = "\(resultInt)"
            }
        case "x!":
            numberResult = numberFirst
            let resultInt = Int(numberResult)
            firstLabel.text = "\(factorialComputation(value: resultInt))"
        case "x²":
            numberResult = pow(numberFirst, 2.0)
            let resultInt = Int(numberResult)
            firstLabel.text = "\(resultInt)"
        case "√":
            numberResult = sqrt(numberFirst)
            let resultInt = Int(numberResult)
            firstLabel.text  = "\(resultInt)"
    
        default:
            firstLabel.text = "Error"
        }
    }
    
    @IBAction func buttonPlus(_ sender: Any) {
        calculatorOperator = "+"
        calculatorOperatorText(operator: calculatorOperator)
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        calculatorOperator = "-"
        calculatorOperatorText(operator: calculatorOperator)
    }
    
    @IBAction func buttonMultiply(_ sender: Any) {
        calculatorOperator = "X"
        calculatorOperatorText(operator: calculatorOperator)
    }

    @IBAction func buttonDividedBy(_ sender: Any) {
        calculatorOperator = "÷"
        calculatorOperatorText(operator: calculatorOperator)
    }
    
    @IBAction func buttonSquare(_ sender: Any) {
        calculatorOperator = "x²"
    }
    
    @IBAction func buttonSquareRoot(_ sender: Any) {
        calculatorOperator = "√"
    }
    
    @IBAction func buttonClear(_ sender: Any) {
        firstLabel.text = "0"
        secondLabel.text?.removeAll()
        thirdLabel.text?.removeAll()
        textNumber.removeAll()
    }
    
    @IBAction func buttonFactorial(_ sender: Any) {
        calculatorOperator = "x!"
    }
}

