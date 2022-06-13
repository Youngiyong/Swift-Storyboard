//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by giyong on 2022/06/12.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {

    //uicomponent 연결하자
    //uicomponent에 데이터를 업데이트하는 코드를 넣자
    
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel){
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrentFormat(price: stock.price)) 원"
        
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff)%"
    }
    
    func convertToCurrentFormat(price: Int)-> String {
        let nuberFormatter = NumberFormatter()
        nuberFormatter.numberStyle = .decimal
        nuberFormatter.maximumFractionDigits = 0
        let result = nuberFormatter.string(from: NSNumber(value: price)) ?? ""
        
        return result
    }
}
