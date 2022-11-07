//
//  ResultViewCell.swift
//  Meli
//
//  Created by Jhonnatan Macias on 2/11/22.
//

import Foundation
import SDWebImage
import UIKit

class ResultViewCell: UITableViewCell {

    private enum Constants {
        static let titleTopMargin: CGFloat = 10
        static let titleLeftMargin: CGFloat = 40
        static let titleRightMargin: CGFloat = 50
        static let readIconHeight: CGFloat = 14
        static let readIconLeftMargin: CGFloat = 12
        static let starIconSize: CGFloat = 22
        static let starIconLeftMargin: CGFloat = 10
    }

    // MARK: - Properties

    private var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    private var itemImage: UIImageView = {
        let image = UIImageView.newAutolayoutImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8.0
        image.clipsToBounds = true
        return image
    }()

    private var titleLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()

    var viewModel: ResultCellViewModelProtocol! {
        didSet {
            viewModel.title.bindAndFire { [weak self] message in
                guard let self = self else {
                    return
                }

                self.titleLabel.text = message
            }

            viewModel.image.bindAndFire { [weak self] imageURL in
                guard let self = self else { return }

                self.itemImage.sd_setImage(with: URL(string: imageURL),
                                             placeholderImage: UIImage(named: "placeholder.png"))
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override func prepareForReuse() {
        itemImage.image = nil
        titleLabel.text = ""
    }

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    // MARK: - Private function

    private func commonInit() {

        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none

        contentView.addSubview(containerView)
        NSLayoutConstraint.activate(ConstraintUtil.pinAllSides(of: containerView, to: contentView))

        contentView.addSubview(itemImage)
        NSLayoutConstraint.activate([ConstraintUtil.pinLeftOfView(itemImage,
                                                                  toLeftOfView: containerView),
                                     ConstraintUtil.pinTopOfView(itemImage, toTopOfView: containerView,
                                                                 withMargin: Constants.titleTopMargin),
                                     ConstraintUtil.setHeight(60, toView: itemImage),
                                     ConstraintUtil.setWidth(100, toView: itemImage),
                                     ConstraintUtil.pinBottomOfView(itemImage,
                                                                    toBottomOfView: containerView,
                                                                    withMargin: -Constants.titleTopMargin)
                                    ])

        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([ConstraintUtil.pinRightOfView(titleLabel,
                                                                   toRightOfView: containerView,
                                                                   withMargin:
                                                                    -Constants.titleRightMargin),
                                     ConstraintUtil.centerViewVertically(titleLabel,
                                                                         inContainingView: itemImage),
                                     ConstraintUtil.pinLeftToRightOfView(titleLabel,
                                                                         toRightOfView: itemImage,
                                                                        withMargin: 4)
                                    ])
    }

}

