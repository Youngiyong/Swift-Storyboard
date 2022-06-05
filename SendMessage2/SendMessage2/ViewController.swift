//
//  ViewController.swift
//  SendMessage2
//
//  Created by Kenny on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var tfMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        let numCheck = checkNil(str: tfMessage.text!)
        if numCheck == 1{
            tvMessage.text += tfMessage.text! + "\n"
        }
        tfMessage.text?.removeAll()
    }
    
    @IBAction func btnEmoji1(_ sender: UIButton) {
        tfMessage.text! += "😀"
    }
    
    @IBAction func btnEmoji2(_ sender: UIButton) {
        tfMessage.text! += "😍"
    }
    
    @IBAction func btnEmoji3(_ sender: UIButton) {
        tfMessage.text! += "🥹"
    }
    
    func checkNil(str: String) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
}// ViewController

