//
//  CurrencyRate.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 15/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

public struct CurrencyRate: Equatable {
    var base: String
    var rate: Double
    
    public init(base: String, rate: Double) {
        self.base = base
        self.rate = rate
    }
    
    public func getFlag() -> String {
        return Flag().getFlag(base: self.base)
    }
}
