//
//  StockRankViewController.swift
//  StockRank
//
//  Created by giyong on 2022/06/12.
//

import UIKit

class StockRankViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data, Presentation, Layout
    // Data - 어떤 데이터?? --> stockList
    // Presentation - 셀을 어떻게 표현할지??
    // Layout - 셀을 어떻게 배치할지??
    
    // protocol - 시행 규칙
    
    let stockList: [StockModel] = StockModel.list;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

  

}


extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        guard <Ddddd 꼭 참이어야하는 조건> else {
//
//        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
    

}


extension StockRankViewController: UICollectionViewDelegateFlowLayout {
        //하나의 셀에 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
        // 80
        return CGSize(width:  collectionView.bounds.width, height: 80)

    }
    

}
