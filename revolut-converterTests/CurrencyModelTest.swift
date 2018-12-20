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
    let jsonUpdated = JSON(CurrencyTestData.mockReseivedDataUpdated)

    func testModelInitFromJSON() {
        XCTAssertEqual(Currency.init(json), CurrencyTestData.mockCurrency, "Map Currency model from JSON failed")
    }
    
    func testUpdateFromJSON() {
        let currency = Currency.init(json)
        currency.update(json: jsonUpdated)
        
        print(currency.rates)
        print(CurrencyTestData.mockCurrencyUpdated.rates)

        XCTAssertEqual(currency, CurrencyTestData.mockCurrencyUpdated, "Update Currency model from JSON failed")
    }
    
    func testCalculateRate() {
        let base = "AUD"
        let currency = Currency.init(json)

        let rateValue = currency.calculateRateValue(base: base)
        XCTAssertEqual(rateValue, 1 / (1 / 1.6132) , "Calculate rate failed")
        
    }


    func testMoveRateToFirstIndex() {
        let testSampleRates = [CurrencyRate(base: "EUR", rate: 1.0), CurrencyRate(base: "AUD", rate: 1.6132), CurrencyRate(base: "BGN", rate: 1.952), CurrencyRate(base: "BRL", rate: 4.7824)]
        let currency = Currency.init(json)
        currency.rates = testSampleRates
        currency.moveRateToFirstIndex(from: 2)
        
        let testResultRates = [CurrencyRate(base: "BGN", rate: 1.952), CurrencyRate(base: "EUR", rate: 1.0), CurrencyRate(base: "AUD", rate: 1.6132), CurrencyRate(base: "BRL", rate: 4.7824)]

        
        XCTAssertEqual(currency.rates, testResultRates, "Move rate to first index failed")
    }

}
