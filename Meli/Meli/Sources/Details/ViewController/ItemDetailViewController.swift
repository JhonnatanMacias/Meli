//
//  ItemDetailViewController.swift
//  Meli
//
//  Created by Jhonnatan Macias on 6/11/22.
//

import Foundation
import SDWebImage
import UIKit

class ItemDetailViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let pageTitle: String = "Detalle del Producto"
        static let amountTitle: String = "Cantidad Disponible: "
        static let soldTitle: String = "Cantidad Vendidos: "
        static let bulletTitle: String = "Lo que tienes que saber de este producto:"
        static let sippingTitle: String = "Envio"
        static let sellerTitle: String = "Información del Vendedor"
    }

    // MARK: - Properties

    var viewModel: ItemDetailViewModelProtocol! {
        didSet {
            viewModel.title.bindAndFire { [weak self] message in
                guard let self = self else {
                    return
                }

                self.titleLabel.text = message
            }

            viewModel.price.bindAndFire { [weak self] message in
                guard let self = self else {
                    return
                }

                let htmlFormat = message.html2Attributed
                self.priceLabel.attributedText = htmlFormat
                self.priceLabel.font = UIFont.systemFont(ofSize: 18)
            }

            viewModel.soldQuantity.bindAndFire { [weak self] quantity in
                guard let self = self else {
                    return
                }

                self.setupQuantity(title: Constants.soldTitle,
                                    amount: quantity,
                                   label: self.soldQuantityLabel)

            }

            viewModel.sellerInfo.bindAndFire { [weak self] message in
                guard let self = self else {
                    return
                }

                self.sellerLabel.text = message
            }

            viewModel.image.bindAndFire { [weak self] imageURL in
                guard let self = self else {
                    return
                }

                self.itemImage.sd_setImage(with: URL(string: imageURL),
                                             placeholderImage: UIImage(named: "placeholder.png"))
            }

            viewModel.bulletedModel.bindAndFire { [weak self] model in
                guard let self = self else {
                    return
                }

                self.setupBulleted(model: model)
            }

            viewModel.quantity.bindAndFire { [weak self] quantity in
                guard let self = self else {
                    return
                }

                self.setupQuantity(title: Constants.amountTitle,
                                   amount: quantity,
                                   label: self.amountLabel)
            }

            viewModel.shippingModel.bindAndFire { [weak self] model in
                guard let self = self else {
                    return
                }

                self.setupShipping(model: model)
            }

            viewModel.storePickupModel.bindAndFire { [weak self] model in
                guard let self = self else {
                    return
                }

                self.setupStorePickUp(model: model)
            }
        }
    }

    private func setupBulleted(model: BulletedCopyBlockModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            self.bulletTitle.isHidden = false
            self.bulletedView.model = model
        }
    }

    private func setupQuantity(title: String, amount: Int, label: UILabel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            let quantity: String = " \(amount)"
            self.textDescriptionStyle(title: title,
                                      textValue: quantity,
                                      label: label)

        }
    }

    private func setupShipping(model: TagViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            self.tagView.model = model
        }
    }

    private func setupStorePickUp(model: TagViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            self.storeTagView.model = model
        }
    }

    private func textDescriptionStyle(title: String, textValue: String, label: UILabel) {
        let attributedAmount = NSMutableAttributedString(string: title)

        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.darkBlue(),
                                                         .font: UIFont.boldSystemFont(ofSize: 14)]

        attributedAmount.addAttributes(attributes, range: NSRange(location: 0,
                                                                  length: title.count))
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                .font: UIFont.systemFont(ofSize: 14)]
        let secondString = NSAttributedString(string: textValue, attributes: secondAttributes)
        attributedAmount.append(secondString)

        label.attributedText = attributedAmount
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.scrollIndicatorInsets = .zero
        scrollView.contentInset = .zero
        scrollView.keyboardDismissMode = .onDrag
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private var itemImage: UIImageView = {
        let image = UIImageView.newAutolayoutImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private var titleLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.darkBlue()
        return label
    }()

    private var priceLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private lazy var bulletTitle: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.text = Constants.bulletTitle
        return label
    }()

    private var bulletedView: BulletedCopyBlock = {
        let view = BulletedCopyBlock()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var amountLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()

    private var soldQuantityLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()

    private var shippingTitleLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.text = Constants.sippingTitle
        return label
    }()

    private var tagView: TagView = {
        let view = TagView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var storeTagView: TagView = {
        let view = TagView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var sellerTitleLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.text = Constants.sellerTitle
        return label
    }()

    private var sellerLabel: UILabel = {
        let label = UILabel.newAutolayoutLabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        constructView()
        constructSubviewHierarchy()
        constructSubviewLayoutConstraints()

        self.edgesForExtendedLayout = []
         self.navigationController?.navigationBar.isTranslucent = false

    }

    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)

       self.edgesForExtendedLayout = []
        self.navigationController?.navigationBar.isTranslucent = false
    }

    private func constructView() {
        title = Constants.pageTitle
        view.backgroundColor = .white
        setupPageStyle()
    }

    private func constructSubviewHierarchy() {
        view.addSubview(itemImage)
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(amountLabel)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(bulletTitle)
        scrollView.addSubview(bulletedView)
        scrollView.addSubview(soldQuantityLabel)
        scrollView.addSubview(shippingTitleLabel)
        scrollView.addSubview(tagView)
        scrollView.addSubview(storeTagView)
        scrollView.addSubview(sellerTitleLabel)
        scrollView.addSubview(sellerLabel)
    }

    private func constructSubviewLayoutConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([ConstraintUtil.setHeight(60, toView: itemImage),
                                     ConstraintUtil.setWidth(100, toView: itemImage),
                                     ConstraintUtil.centerViewHorizontally(itemImage, inContainingView: view)
        ])

        itemImage.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30).isActive = true

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(scrollView, toBottomOfView: itemImage),
            ConstraintUtil.pinLeftOfView(scrollView, toLeftOfView: view),
            ConstraintUtil.pinRightOfView(scrollView, toRightOfView: view),
            ConstraintUtil.pinBottomOfView(scrollView, toBottomOfView: view)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopOfView(titleLabel, toTopOfView: scrollView, withMargin: 20),
            ConstraintUtil.pinLeftOfView(titleLabel, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(titleLabel, toRightOfView: view, withMargin: -16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(priceLabel, toBottomOfView: titleLabel, withMargin: 4),
            ConstraintUtil.centerViewHorizontally(priceLabel, inContainingView: view)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(amountLabel, toBottomOfView: priceLabel, withMargin: 20),
            ConstraintUtil.pinLeftOfView(amountLabel, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(amountLabel, toRightOfView: view, withMargin: -16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(soldQuantityLabel, toBottomOfView: amountLabel, withMargin: 8),
            ConstraintUtil.pinLeftOfView(soldQuantityLabel, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(soldQuantityLabel, toRightOfView: view, withMargin: -16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(bulletTitle, toBottomOfView: soldQuantityLabel, withMargin: 20),
            ConstraintUtil.pinLeftOfView(bulletTitle, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(bulletTitle, toRightOfView: view, withMargin: -16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(bulletedView, toBottomOfView: bulletTitle, withMargin: 8),
            ConstraintUtil.pinLeftOfView(bulletedView, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(bulletedView, toRightOfView: view, withMargin: -16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(shippingTitleLabel,
                                                toBottomOfView: bulletedView,
                                                withMargin: 16),
            ConstraintUtil.pinLeftOfView(shippingTitleLabel, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(shippingTitleLabel, toRightOfView: view, withMargin: -16)
        ])


        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(tagView,
                                                toBottomOfView: shippingTitleLabel,
                                                withMargin: 8),
            ConstraintUtil.pinLeftOfView(tagView, toLeftOfView: view, withMargin: 16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(storeTagView,
                                                toBottomOfView: tagView,
                                                withMargin: 8),
            ConstraintUtil.pinLeftOfView(storeTagView, toLeftOfView: view, withMargin: 16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(sellerTitleLabel,
                                                toBottomOfView: storeTagView,
                                                withMargin: 16),
            ConstraintUtil.pinLeftOfView(sellerTitleLabel, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(sellerTitleLabel, toRightOfView: view, withMargin: -16)
        ])

        NSLayoutConstraint.activate([
            ConstraintUtil.pinTopToBottomOfView(sellerLabel,
                                                toBottomOfView: sellerTitleLabel,
                                                withMargin: 16),
            ConstraintUtil.pinLeftOfView(sellerLabel, toLeftOfView: view, withMargin: 16),
            ConstraintUtil.pinRightOfView(sellerLabel, toRightOfView: view, withMargin: -16),
            ConstraintUtil.pinBottomOfView(sellerLabel, toBottomOfView: scrollView, withMargin: -40)
        ])

    }


    private func setupPageStyle() {
        self.title = Constants.pageTitle
        view.backgroundColor = .white
        bulletTitle.isHidden = true
    }

}

extension String {
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue,
                                                    .targetTextScaling: 1],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

extension NSMutableAttributedString{
    func getAttributedStringByAppending(attributedString:NSMutableAttributedString) -> NSMutableAttributedString{
        let newAttributedString = NSMutableAttributedString()
        newAttributedString.append(self)
        newAttributedString.append(attributedString)
        return newAttributedString
    }
}
