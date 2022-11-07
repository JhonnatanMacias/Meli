//
//  BulletedCopyBlockCellModel.swift
//  Meli
//
//  Created by Jhonnatan Macias on 6/11/22.
//

import Foundation
import UIKit

struct BulletedCopyBlockCellModel {

    let displayImage: Bool?
    let bulletTitle: String?
    let bulletParagraph: String?

    var hasImage: Bool {
        return displayImage ?? false
    }

    init(bulletTitle: String?,
         bulletParagraph: String?,
         displayImage: Bool? = true) {
        self.bulletTitle = bulletTitle
        self.bulletParagraph = bulletParagraph
        self.displayImage = displayImage
    }

}

struct BulletedCopyBlockModel {
    let cells: [BulletedCopyBlockCellModel]

    init(cells: [BulletedCopyBlockCellModel]) {
        self.cells = cells
    }
}


struct TagViewModel {

    let tagTitle: String?
    let isAvailable: Bool?
    let textColor: UIColor
    let backgroundColor: UIColor

    init(tagTitle: String?,
         isAvailable: Bool?) {

        self.tagTitle = tagTitle
        self.isAvailable = isAvailable

        if isAvailable ?? false {
            self.textColor = UIColor.tagDefaultTextColor()
            self.backgroundColor = UIColor.tagDefaultColor()
        } else {
            self.textColor = UIColor.tagUnavailableTextColor()
            self.backgroundColor = UIColor.tagUnavailableColor()
        }
    }
}
