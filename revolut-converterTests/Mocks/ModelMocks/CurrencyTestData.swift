//
//  CurrencyTestData.swift
//  revolut-converterTests
//
//  Created by Андрей Рожков on 06/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation
@testable import revolut_converter

struct CurrencyTestData {
    
    private init() {}
    
    static let mockReseivedString = "{\"base\":\"EUR\",\"date\":\"2018-09-06\",\"rates\":{\"AUD\":1.6132,\"BGN\":1.952,\"BRL\":4.7824}}"
    static var mockReseivedData: Data {
        get {
            return self.mockReseivedString.data(using: .utf8)!
        }
    }
    
    static let mockReseivedStringUpdated = "{\"base\":\"EUR\",\"date\":\"2019-09-06\",\"rates\":{\"AUD\":1.6146,\"BGN\":1.927,\"BRL\":4.7846}}"
    static var mockReseivedDataUpdated: Data {
        get {
            return self.mockReseivedStringUpdated.data(using: .utf8)!
        }
    }
    
    static let mockCurrency = Currency(base: "EUR", date: "2018-09-06", rates: [CurrencyRate(base: "AUD", rate: 1.6132), CurrencyRate(base: "BGN", rate: 1.952), CurrencyRate(base: "BRL", rate: 4.7824)])
    static let mockCurrencyUpdated = Currency(base: "EUR", date: "2019-09-06", rates: [CurrencyRate(base: "AUD", rate: 1.6146), CurrencyRate(base: "BGN", rate: 1.927), CurrencyRate(base: "BRL", rate: 4.7846)])
}
