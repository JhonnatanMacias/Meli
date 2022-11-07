//
//  BulletedCopyBlockCellTest.swift
//  MeliTests
//
//  Created by Jhonnatan Macias on 7/11/22.
//

import Foundation
import Meli
@testable import Meli
import XCTest

class BulletedCopyBlockCellTest: XCTestCase {

    enum Constants {
        static let bulletTitleText = ["Trained to deliver excellent service",
                                      "Deliveries made by familiar faces",
                                      "Watch your delivery live, on camera",
                                      "Safety from start to finish "]

        static let longParagraph = """
        Quidam officiis similique sea ei,\
        vel tollit indoctum efficiendi ei.
        """

        static let onelineParagraph = "Quidam officiis similique sea ei "

        static let twoLineParagraph = """
        Quidam officiis similique sea ei,\
        vel tollit indoctum efficiendi ei,
        """

        static let threeLineParagraph = """
        Quidam officiis similique sea ei,\
        vel tollit indoctum efficiendi ei,\
        vel tollit indoctum efficiendi ei,
        """

        static let bulletParagraphText = [longParagraph,
                                          onelineParagraph,
                                          twoLineParagraph,
                                          threeLineParagraph]
    }

    func testRequieredFields() {
        let model = viewModel(from: Constants.bulletTitleText[0],
                              paragraph: Constants.bulletParagraphText[0])
        let viewSUT = BulletedCopyBlockCell(model: model)

        XCTAssertNotNil(model)
        XCTAssertNotNil(viewSUT)

        XCTAssertNotNil(viewSUT.testHooks.heading)
        XCTAssertEqual(viewSUT.testHooks.heading?.text, Constants.bulletTitleText[0])

        XCTAssertNotNil(viewSUT.testHooks.paragraph)
        XCTAssertEqual(viewSUT.testHooks.paragraph?.text, Constants.bulletParagraphText[0])

        XCTAssertNotNil(viewSUT.testHooks.paragraph)
    }

    func testValidateHeightConstraints() {
        let model = viewModel(from: Constants.bulletTitleText[0],
                              paragraph: Constants.bulletParagraphText[0])
        let viewSUT = BulletedCopyBlockCell(model: model)

        XCTAssertNotNil(model)
        XCTAssertNotNil(viewSUT)

        XCTAssertEqual(0, viewSUT.testHooks.heightConstraint.constant)

    }

     func createCellViewModels() -> [BulletedCopyBlockCellModel] {
        var cellViewModels: [BulletedCopyBlockCellModel] = []

        for i in 0...3 {
            cellViewModels.append(viewModel(from: Constants.bulletTitleText[i],
                                            paragraph: Constants.bulletParagraphText[i]))
        }

        return cellViewModels
    }

    func viewModel(from title: String,
                   paragraph: String) -> BulletedCopyBlockCellModel {


        return BulletedCopyBlockCellModel(bulletTitle: title, bulletParagraph: paragraph)
    }
}

