//
//  BulletedCopyBlock.swift
//  Meli
//
//  Created by Jhonnatan Macias on 6/11/22.
//

import Foundation
import UIKit

final class BulletedCopyBlock: UIView {

    // MARK: - Model

    var model: BulletedCopyBlockModel? {
        didSet {
            applyModel()
        }
    }

    private func applyModel() {
        guard let model = model else { return }
        backgroundColor = UIColor.ligthBlueBackground()

        bulletList.removeAllArrangedSubviews()
        bulletList.subviews.forEach { $0.removeFromSuperview() }
        bulletList.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for cellModel in model.cells {
            let newCell = BulletedCopyBlockCell(model: cellModel)
            bulletList.addArrangedSubviews(newCell)
        }
    }

    // MARK: - Initalization

    init(model: BulletedCopyBlockModel? = nil) {
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

    /// The stack view containing the Bullet-Image and the textArea
    private lazy var bulletList: UIStackView = {
        let stackView = UIView.newAutolayoutStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 24
        return stackView

    }()

    // MARK: - View construction

    func constructView() {
        addSubview(bulletList)
    }

    func constructSubviewLayoutConstraints() {

        let insets = LayoutConstrainingInsets(top: -16,
                                              leading: -16,
                                              bottom: -24,
                                              trailing: -16)
        NSLayoutConstraint.activate([
            constraints(pinningTo: bulletList, edges: .all, insets: insets)
        ])
    }
}

#if DEBUG
extension BulletedCopyBlock {
    var testHooks: TestHooks { .init(target: self) }

    struct TestHooks {
        let target: BulletedCopyBlock

        var bulletList: UIStackView {
            return target.bulletList
        }

        var model: BulletedCopyBlockModel? {
            return target.model
        }
    }
}
#endif
