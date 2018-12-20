//
//  CurrencyModelTest.swift
//  revolut-converterTests
//
//  Created by Андрей Рожков on 06/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import revolut_converter

class CurrencyModelTest: XCTestCase {

    let json = JSON(CurrencyTestData.mockReseivedData)
    
    func testModelInitFromJSON() {
        XCTAssertEqual(Currency.init(json), CurrencyTestData.mockCurrency, "Map Currency model from JSON failed")
    }

}
