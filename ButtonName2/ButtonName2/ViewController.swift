//
//  ViewController.swift
//  ButtonName2
//
//  Created by Kenny on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblCat.text = "😽"
    }

    @IBAction func btnCat(_ sender: UIButton) {
        lblCat.text! += "😽"
    }
    
}//ViewController

