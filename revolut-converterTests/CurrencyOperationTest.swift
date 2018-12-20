//
//  CurrencyOperationTest.swift
//  revolut-converterTests
//
//  Created by Андрей Рожков on 06/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import XCTest
@testable import revolut_converter

class CurrencyOperationTest: XCTestCase {

    private var environment: Environment!
    private var dispatcher: NetworkDispatcherMock!

    let mockReseivedString = CurrencyTestData.mockReseivedString
    var mockReseivedData = CurrencyTestData.mockReseivedData
    let mockCurrency = CurrencyTestData.mockCurrency
    
    
    override func setUp() {
        
        environment = DefaultEnvironment()
        dispatcher = NetworkDispatcherMock(environment: environment)
    }
    
    override func tearDown() {
        
        environment = nil
        dispatcher = nil
    }
    
    
    func testCurrencyOperationSuccess() {
        
        dispatcher.result = Response.success(mockReseivedData)
        
        CurrencyOperation().execute(in: dispatcher, completition: { [unowned self] (currency, status) in
            XCTAssertEqual(currency, self.mockCurrency, "CurrencyOperation result aren't equal to reference model")
            XCTAssertEqual(status, OperationStatus.success, "CurrencyOperation status aren't success")

        })
    }
    
    func testCurrencyOperationError() {
        
        let dispatcherResult = [Response.error(nil, nil), Response.noData]

        for dr in dispatcherResult {
            dispatcher.result = dr
            CurrencyOperation().execute(in: dispatcher, completition: { (currency, status) in
                XCTAssertNil(currency, "CurrencyOperation result aren't nil while an error")
                XCTAssertEqual(status, OperationStatus.error, "CurrencyOperation status aren't error")
            })
        }
    }

}
