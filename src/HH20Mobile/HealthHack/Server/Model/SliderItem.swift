//
//  OfferNewsFeedItem.swift
//  Helsana
//
//  Created by Domenico Papaccio on 03.08.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import Foundation
import UIKit

struct SliderItem {
    private let id: String?
    private let title: String?
    private let subtitle: String?
    private let image: UIImage?
    
    init(id: String?,
         title: String?,
         subtitle: String?,
         image: UIImage?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
    
    func getId() -> String {
        return id ?? ""
    }

    func getTitle() -> String {
        return title ?? ""
    }

    func getSubTitle() -> String {
        return subtitle ?? ""
    }

    func getImage() -> UIImage? {
        return image
    }
}
