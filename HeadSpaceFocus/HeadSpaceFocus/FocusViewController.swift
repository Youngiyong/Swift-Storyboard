//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by giyong on 2022/07/05.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Focus] = Focus.list
    
    var curated: Bool = false
    
    typealias Item = Focus
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    
    @IBOutlet weak var refreshButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshButton.layer.cornerRadius = 10
        //Presenatation, Data, Layout
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
        // Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
        
        // Layout
        
        collectionView.collectionViewLayout = layout()
        
        updateButtonTitle()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    func updateButtonTitle(){
        let title = curated ? "See All" : "See Recomendation"
        
        refreshButton.setTitle(title, for: .normal)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        curated.toggle()
        
        self.items = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
        
        updateButtonTitle()
    }
}
