//
//  UIView+Extension.swift
//  Meli
//
//  Created by Jhonnatan Macias on 31/10/22.
//

import Foundation
import UIKit

extension UIView {

    class func newAutolayoutLabel() -> UILabel {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.adjustsFontForContentSizeCategory = true
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return label
    }

    class func newAutolayoutStackView() -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    class func newAutolayoutTableView() -> UITableView {
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        return tableView
    }

    class func newAutolayoutImageView() -> UIImageView {
        let image : UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }

}

public extension Collection {

    /// A Boolean value indicating whether the collection contains one or more elements.
    ///
    /// - Complexity: O(1)
    @inlinable var isNotEmpty: Bool {
        !isEmpty
    }
}
