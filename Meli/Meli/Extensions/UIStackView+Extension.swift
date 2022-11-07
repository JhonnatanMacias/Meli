//
//  UIStackView+Extension.swift
//  Meli
//
//  Created by Jhonnatan Macias on 6/11/22.
//

import Foundation
import UIKit

public extension UIStackView {

    /// Removes all arranged subviews from the `arrangedSubviews` array. It does **not** remove the arranged
    /// subviews from the view hierarchy.
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach(removeArrangedSubview(_:))
    }

    /// Convenience initializer that allows you to set the `axis`, `alignment`, and/or `distribution` when creating the
    /// stack view.
    /// - Author: Alex Johnson
    convenience init(axis: NSLayoutConstraint.Axis,
                     alignment: UIStackView.Alignment = .fill,
                     distribution: UIStackView.Distribution = .fill,
                     spacing: CGFloat = 0) {
        self.init()
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }

    /// Appends the contents of `views` to the end of the `arrangedSubviews` array.
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview(_:))
    }

    /// Appends the contents of `views` to the end of the `arrangedSubviews` array.
    func addArrangedSubviews(_ views: UIView...) {
        addArrangedSubviews(views)
    }

    /// Adds an arranged subview and applies custom spacing after the specified view.
    ///
    /// - Parameters:
    ///   - arrangedSubview: e view to be added to the array of views arranged by the stack.
    ///   - spacing: The amount of spacing.
    func addArrangedSubview(_ arrangedSubview: UIView, customSpacing spacing: CGFloat) {
        addArrangedSubview(arrangedSubview)
        setCustomSpacing(spacing, after: arrangedSubview)
    }
}
