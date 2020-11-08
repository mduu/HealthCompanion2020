//
//  HomeViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 05.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            let homePagerCellNib = UINib(nibName: HomePagerCell.cellIdentifier, bundle: nil)
            self.tableView.register(homePagerCellNib, forCellReuseIdentifier: HomePagerCell.cellIdentifier)
        }
    }
    
    // MARK: - Attributers
    var viewModel: HomeViewModel!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLargeTitle(enabled: true)
        applyStyle()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        viewModel.loadSliders {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    private func applyStyle() {
        view.backgroundColor = .hintergrundApp()
    }
    
}

// MARK: - HomeUserInterface
extension HomeViewController: HomeUserInterface {
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //viewModel.didSelectNewsFeedItem(inCollection: collectionView.tag, itemID: indexPath.item)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.dataSource[collectionView.tag].items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard viewModel.dataSource.count > indexPath.section else {
            return UICollectionViewCell()
        }
        
        let sliderItem = viewModel.dataSource[collectionView.tag]
        
        return getOfferNewsFeedCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .hintergrundApp()

        let sectionLabel = UILabel(frame: CGRect(x: 24, y: 0, width:
        tableView.bounds.size.width, height: tableView.bounds.size.height))
        sectionLabel.accessibilityIdentifier = "sectionLabel\(section)"
        sectionLabel.isAccessibilityElement = true
        sectionLabel.font = UIFont.akkuratBold(ofSize: 20)
        sectionLabel.textColor = .textPrimary()
        sectionLabel.text = self.viewModel.dataSource[section].sectionTitle
        
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePagerCell.cellIdentifier) as! HomePagerCell
        cell.clipsToBounds = true
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
        return cell
    }
}

extension HomeViewController {
    private func getOfferNewsFeedCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderItemCell.cellIdentifier, for: indexPath) as! SliderItemCell
        let offerItems = viewModel.dataSource[collectionView.tag].items as? [SliderItem]
        let offerItem = offerItems?[indexPath.item]
        guard let item = offerItem else {
            return UICollectionViewCell()
        }
        cell.configure(item: item)
        return cell
    }
}


extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = IndexPath(row: 0, section: scrollView.tag)
        if let pagerCell = tableView.cellForRow(at: index) as? HomePagerCell {
            pagerCell.updateCurrentPage()
        }
    }
}

