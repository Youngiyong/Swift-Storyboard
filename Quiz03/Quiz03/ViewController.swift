//
//  ViewController.swift
//  Quiz03
//
//  Created by TJ on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        readOnly()
        // Do any additional setup after loading the view.
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func calculation(calcNum1: String, calcNum2: String) {
        let intNum1: Int = Int(calcNum1)!
        let intNum2: Int = Int(calcNum2)!
        
        resultField.text = String(intNum1 + intNum2)
        resultLabel.text = "계산이 완료되었습니다."
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputField1: UITextField!
    @IBOutlet weak var inputField2: UITextField!
    @IBOutlet weak var resultField: UITextField!
    @IBAction func calculateBtn(_ sender: UIButton) {
        guard let strNum1 = inputField1.text else { return }
        guard let strNum2 = inputField2.text else { return }
        
        let num1Check: Int = checkNilAndEvan(str: strNum1)
        
        let num2Check: Int = checkNilAndEvan(str: strNum2)
        
        if num1Check + num2Check != 2 {
            resultLabel.text = "짝수인 숫자만 입력이 가능합니다."
        } else {
            calculation(calcNum1: strNum1, calcNum2: strNum2)
        }
       
    }
    

    func checkNilAndEvan(str: String) -> Int {
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        let intCheck: Int = Int(check)!
        let intValue: Int = intCheck % 2
        if check.isEmpty {
            return 0
        } else if intValue != 0 {
            return 0
        }
        else {
            return 1
        }
    }
    
    func readOnly(){
        resultField.isUserInteractionEnabled = false
    }
}

