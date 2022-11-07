//
//  TagView.swift
//  Meli
//
//  Created by Jhonnatan Macias on 7/11/22.
//

import Foundation
import UIKit

final class TagView: UIView {

    // MARK: - Model

    var model: TagViewModel? {
        didSet {
            applyModel()
        }
    }

    private func applyModel() {
        guard let model = model else { return }

        backgroundColor = model.backgroundColor
        titleLabel.textColor = model.textColor
        titleLabel.text = model.tagTitle
    }

    // MARK: - Initalization

    init(model: TagViewModel? = nil) {
        self.model = model
        super.init(frame: .zero)
        applyModel()
        constructView()
        constructSubviewLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - UI Elements

    private lazy var titleLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()

    // MARK: - View construction

    func constructView() {
        addSubview(titleLabel)
    }

    func constructSubviewLayoutConstraints() {

        let insets = LayoutConstrainingInsets(top: -8,
                                              leading: -8,
                                              bottom: -8,
                                              trailing: -8)
        NSLayoutConstraint.activate([
            constraints(pinningTo: titleLabel, edges: .all, insets: insets)
        ])
    }
}
