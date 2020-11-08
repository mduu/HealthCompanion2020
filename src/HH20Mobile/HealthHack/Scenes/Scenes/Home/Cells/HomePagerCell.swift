//
//  HomePagerCell.swift
//  Helsana
//
//  Created by Domenico Papaccio on 14.05.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

class HomePagerCell: UITableViewCell {
    
    static let cellIdentifier = "HomePagerCell"
    static var idCounter = 0

    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let offerNewsFeedCellNib = UINib(nibName: SliderItemCell.cellIdentifier, bundle: nil)
            self.collectionView.register(offerNewsFeedCellNib, forCellWithReuseIdentifier: SliderItemCell.cellIdentifier)
            
            let layout = PagingCollectionViewLayout()
            layout.sectionInset = .init(top: 0, left: 24, bottom: 0, right: 24)
            layout.itemSize = .init(width: UIScreen.main.bounds.width - 48, height: collectionView.bounds.height)
            layout.minimumLineSpacing = 12
            layout.scrollDirection = .horizontal
            
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.decelerationRate = .fast
            collectionView.collectionViewLayout = layout
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle()
        setAccessibilityIdentifier()
    }
    
    func updateCurrentPage() {
        let pageWidth = collectionView.frame.size.width
        let currentPage = Int((collectionView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
    }
    
    private func applyStyle() {
        pageControl.currentPageIndicatorTintColor = .textPrimary()
        pageControl.pageIndicatorTintColor = .hintergrundGrau2()
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.tag = row
        collectionView.dataSource = dataSourceDelegate
        collectionView.isPagingEnabled = false
        collectionView.reloadData()
        
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = collectionView.numberOfItems(inSection: 0)
        updateCurrentPage()
        
        applyStyle()
    }
    
    @IBAction private func pageControllDidChange(sender: UIPageControl) {
        let index = sender.currentPage
        if index < collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(row: index, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    private func setAccessibilityIdentifier() {
        isAccessibilityElement = true
        accessibilityIdentifier = "homePagerCell\(HomePagerCell.idCounter)"
        HomePagerCell.idCounter = HomePagerCell.idCounter + 1
    }
}
