//
//  OfferNewsFeedCell.swift
//  Helsana
//
//  Created by Domenico Papaccio on 03.08.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

class SliderItemCell: UICollectionViewCell {
    
    static let cellIdentifier = "SliderItemCell"
    static var idCounter = 0
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var viewInsetContainer: UIView!
    @IBOutlet weak var imageViewOfferImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func applyStyle() {
        viewInsetContainer.applyDefaultShadow()
        viewInsetContainer.applyDefaultBorder()
        viewInsetContainer.applyDefaultRoundCorners()
        
        backgroundColor = UIColor.hintergrundApp()
        viewContent.backgroundColor = UIColor.hintergrundApp()
        viewInsetContainer.backgroundColor = UIColor.hintergrundBox()
        
        labelTitle.font = UIFont.akkurat(ofSize: 20)
        labelTitle.textColor = .textPrimary()
        labelSubtitle.font = UIFont.akkurat(ofSize: 16)
        labelSubtitle.textColor = .textSecondary()
        
        imageViewOfferImage.backgroundColor = .weiss()
    }
    
    func configure(item: SliderItem) {
        labelTitle.text = item.getTitle()
        labelSubtitle.text = item.getSubTitle()
        setImage(item: item)
        applyStyle()
    }
    
    private func setImage(item: SliderItem) {
        imageViewOfferImage.image =  item.getImage()
    }
}
