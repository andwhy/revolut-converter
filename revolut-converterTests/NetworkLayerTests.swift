//
//  NetworkLayerTests.swift
//  revolut-converterTests
//
//  Created by Андрей Рожков on 05/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import XCTest
@testable import revolut_converter

class NetworkLayerTests: XCTestCase {

    static let mockURLString = "https://revolut.duckdns.org/"
    

    func testEnvironment() {
        let environment = DefaultEnvironment()
        
        XCTAssertEqual(environment.host, NetworkLayerTests.mockURLString, "Environment host url equal to reference url")
    }
    
}
