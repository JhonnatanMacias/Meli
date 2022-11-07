//
//  UINavigation+Extensions.swift
//  Meli
//
//  Created by Jhonnatan Macias on 6/11/22.
//

import Foundation
import UIKit

public extension UINavigationBar {

    /// Applies new tint color to appearances styling to all the salient UIKit components
    /// passing nil will leave the existing value for the parameter
    func customizeBar(withBarTintColor barTintColor: UIColor? = nil,
                      tintColor: UIColor? = nil,
                      titleTextColor: UIColor? = nil) {

        let appearance = UINavigationBar.navigationBarAppearance.copy()

        if let barTintColor = barTintColor {
            self.standardAppearance.backgroundColor = barTintColor
            appearance.backgroundColor = barTintColor
            self.barTintColor = barTintColor
        }

        if let tintColor = tintColor {
            self.tintColor = tintColor
        }

        if let titleTextColor = titleTextColor {
            appearance.titleTextAttributes[NSAttributedString.Key.foregroundColor] = titleTextColor
            var titleTextAttributes = self.titleTextAttributes ?? [NSAttributedString.Key: Any]()
            titleTextAttributes[NSAttributedString.Key.foregroundColor] = titleTextColor
            self.titleTextAttributes = titleTextAttributes
        }

        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
    }

    static var navigationBarAppearance: UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundColor = UIColor.blue
        navBarAppearance.shadowColor = .clear

        let backButtonAppearance = UIBarButtonItemAppearance()
        let backButtonTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.clear,
            .font: UIFont.systemFont(ofSize: 0.5)
        ]
        backButtonAppearance.normal.titleTextAttributes = backButtonTextAttributes
        backButtonAppearance.highlighted.titleTextAttributes = backButtonTextAttributes
        navBarAppearance.backButtonAppearance = backButtonAppearance

        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        navBarAppearance.titleTextAttributes = textAttributes
        navBarAppearance.largeTitleTextAttributes = textAttributes

        navBarAppearance.buttonAppearance.normal.titleTextAttributes = textAttributes
        navBarAppearance.buttonAppearance.highlighted.titleTextAttributes = textAttributes

        let backIndicatorImage = navBarAppearance.backIndicatorImage
            .withAlignmentRectInsets(
                UIEdgeInsets(
                    top: 0,
                    left: -16,
                    bottom: 0,
                    right: 0
                )
            )

        navBarAppearance.setBackIndicatorImage(backIndicatorImage, transitionMaskImage: backIndicatorImage)

        return navBarAppearance
    }
}
