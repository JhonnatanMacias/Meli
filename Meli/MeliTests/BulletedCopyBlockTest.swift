//
//  BulletedCopyBlockTest.swift
//  MeliTests
//
//  Created by Jhonnatan Macias on 7/11/22.
//

import Meli
@testable import Meli
import XCTest

class BulletedCopyBlockTest: XCTestCase {

    private enum Constants {
        static let bulletTitleText = ["Trained to deliver excellent service",
                                      "Deliveries made by familiar faces",
                                      "Watch your delivery live, on camera",
                                      "Safety from start to finish "]

        static let longParagraph = """
        Quidam officiis similique sea ei,\
        vel tollit indoctum efficiendi ei,\
        at nihil tantas platonem eos.
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

    func testRequiredFields() {
        let cellModels: [BulletedCopyBlockCellModel] = createCellViewModels()
        let viewModel = BulletedCopyBlockModel(cells: cellModels)
        let viewSUT = BulletedCopyBlock(model: viewModel)

        XCTAssertNotNil(viewModel)
        XCTAssertNotNil(cellModels)
        XCTAssertNotNil(viewSUT)

        XCTAssertNotNil(viewSUT.testHooks.bulletList)
        XCTAssertEqual(viewSUT.testHooks.model?.cells.count, cellModels.count)
        XCTAssertNotNil(viewSUT.testHooks.model?.cells)
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

       return BulletedCopyBlockCellModel(bulletTitle: title,
                                  bulletParagraph: paragraph)

   }

}
