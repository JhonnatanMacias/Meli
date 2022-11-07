//
//  UIColor+Extension.swift
//  Meli
//
//  Created by Jhonnatan Macias on 31/10/22.
//

import Foundation
import UIKit

public extension UIColor {

    static func ligthBlue() -> UIColor {
        UIColor(red: 147/255.0, green: 202/255.0, blue: 237/255.0, alpha: 1.0)
    }

    static func darkBlue() -> UIColor {
        UIColor(red: 48/255.0, green: 111/255.0, blue: 213/255.0, alpha: 1.0)
    }

    static func ligthBlueBackground() -> UIColor {
        UIColor(red: 243/255.0, green: 248/255.0, blue: 253/255.0, alpha: 1.0)
    }

    static func favoriteButtonColor() -> UIColor {
        UIColor(red: 239/255.0, green: 184/255.0, blue: 16/255.0, alpha: 1.0)
    }

    static func defaultColor() -> UIColor {
        UIColor(red: 253/255.0, green: 241/255.0, blue: 115/255.0, alpha: 1.0)
    }

    static func tagDefaultColor() -> UIColor {
        UIColor(red: 227/255.0, green: 236/255.0, blue: 243/255.0, alpha: 1.0)
    }

    static func tagDefaultTextColor() -> UIColor {
        UIColor(red: 89/255.0, green: 128/255.0, blue: 163/255.0, alpha: 1.0)
    }

    static func tagUnavailableColor() -> UIColor {
        UIColor(red: 244/255.0, green: 231/255.0, blue: 230/255.0, alpha: 1.0)
    }

    static func tagUnavailableTextColor() -> UIColor {
        UIColor(red: 159/255.0, green: 53/255.0, blue: 65/255.0, alpha: 1.0)
    }

}
