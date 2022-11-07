//
//  BulletedCopyBlockCell.swift
//  Meli
//
//  Created by Jhonnatan Macias on 6/11/22.
//
//

import Foundation
import UIKit

final class BulletedCopyBlockCell: UIView {

    // MARK: - Model

    var model: BulletedCopyBlockCellModel? {
        didSet {
            applyModel()
        }
    }

    private func applyModel() {

        // Bullet Image
        bulletImage.configure()


        // Title
        if let title = model?.bulletTitle {
            bulletTitle.text = title
        }

        // Paragraph

        if let paragraph = model?.bulletParagraph {
            bulletParagraph.text = paragraph
        }

    }

    // MARK: Properties
    private lazy var heightConstraint: NSLayoutConstraint = {
        heightAnchor.constraint(equalToConstant: 0.0)
    }()

    // MARK: - Initalization

     //initWithCode to init view from xib or storyboard
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
     }

    init(model: BulletedCopyBlockCellModel) {
        self.model = model
        super.init(frame: .zero)
        applyModel()
        constructView()
        constructSubviewLayoutConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - UI Elements

    private lazy var imageContainerView: UIView = {
        return UIView(frame: .zero)
    }()

    private lazy var bulletImage: EncircledImage = {
        let bulletImage = EncircledImage()
        bulletImage.translatesAutoresizingMaskIntoConstraints = false
        bulletImage.isAccessibilityElement = true
        bulletImage.accessibilityTraits = .image
        return bulletImage
    }()

    /// The stack view containing the Bullet-Image and the textArea
    private lazy var bulletItem: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()

    /// The stack view containing both Title and Paragraph
    private lazy var textArea: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        return stackView
    }()

    /// A text that sumarizes the information displayed
    private lazy var bulletTitle: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    /// The text presented underneath the title
    private lazy var bulletParagraph: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return label
    }()


    // MARK: View construction

    func constructView() {

        if model?.hasImage ?? false {
            imageContainerView.addSubview(bulletImage)
            bulletItem.addArrangedSubviews(imageContainerView)
        }

        if let content = model?.bulletParagraph, content.isNotEmpty {
            textArea.addArrangedSubviews(bulletTitle)
            textArea.addArrangedSubviews(bulletParagraph)
            bulletItem.addArrangedSubviews(textArea)
            bulletItem.alignment = .center
        } else {
            bulletItem.addArrangedSubviews(bulletTitle)
            bulletItem.alignment = .top
        }

        bulletItem.addSubview(imageContainerView)
        addSubview(bulletItem)
    }

    func constructSubviewLayoutConstraints() {

        NSLayoutConstraint.activate(
            ConstraintUtil.pinAllSides(of: bulletItem, to: self)
        )

        NSLayoutConstraint.activate([
            imageContainerView.widthAnchor.constraint(equalToConstant: 18),
            imageContainerView.heightAnchor.constraint(equalToConstant: 18),
            bulletImage.heightAnchor.constraint(equalToConstant: 18),
            bulletImage.widthAnchor.constraint(equalToConstant: 18)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layoutIfNeeded()
    }
}


#if DEBUG
extension BulletedCopyBlockCell {
    var testHooks: TestHooks { .init(target: self) }

    struct TestHooks {
        let target: BulletedCopyBlockCell

        var heading: UILabel? {
            return target.bulletTitle
        }

        var paragraph: UILabel? {
            return target.bulletParagraph
        }

        var heightConstraint: NSLayoutConstraint {
            return target.heightConstraint
        }
    }
}
#endif
