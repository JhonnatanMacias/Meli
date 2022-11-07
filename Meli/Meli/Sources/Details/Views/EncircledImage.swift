//
//  EncircledImage.swift
//  Meli
//
//  Created by Jhonnatan Macias on 6/11/22.
//

import Foundation
import UIKit

/// This class generates a view with a circle that surrounds the image it recieves,
/// this class is only intended be used by the BulletedCopyBlock,
/// therefore the privatization.
class EncircledImage: UIView {

    // MARK: Constants

    struct Constants {
        static let backgroundColorString = "#eef7fc"
    }

    // MARK: UIElements

    private lazy var imageView: UIView = {
         let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isOpaque = false
        return view
    }()

    // MARK: Functions

    func configure() {
        addSubview(imageView)
        backgroundColor = UIColor.ligthBlue()
        setAutoLayout()
    }

    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        encircle()
    }

    private func encircle() {
        let radius = layer.bounds.width / 2
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
