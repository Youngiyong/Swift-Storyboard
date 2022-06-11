//
//  SymbollerViewController.swift
//  SymBoller
//
//  Created by giyong on 2022/06/11.
//

import UIKit

class SymbollerViewController: UIViewController {

    let symbols: [String] = [ "sun.min", "moon",
    "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    //메모리에 올라가고 화면 준비를함
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To-Do::
        // - 심볼에서 하나를 임의로 추출해서
        // - 이미지와 텍스트를 설정한다.
        
        reload()
        // Do any additional setup after loading the view.
    }
    
    //보여질거야
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //보여졌다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func reload(){
        let symbol: String = symbols.randomElement()!;
        
        imageView.image = UIImage(systemName: symbol)

        label.text = symbol;
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        reload()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
