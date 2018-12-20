//
//  Currency.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 02/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Currency: Equatable {
    public static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.base == rhs.base && lhs.baseValue == rhs.baseValue && lhs.date == rhs.date && lhs.rates == rhs.rates
    }
    
    
    var base: String
    var baseValue: Double = 1 {
        didSet {
            updated!()
        }
    }
    var date: String
    var rates: [CurrencyRate]
    var updated: (() -> Void)?
    
    
    public init(_ json: JSON) {
        self.base = json["base"].stringValue
        self.baseValue = 1
        self.date = json["date"].stringValue
        self.rates = []
        self.rates.append(CurrencyRate(base: "EUR", rate: 1))
        for (key, value):(String, JSON) in json["rates"] {
            self.rates.append(CurrencyRate(base: key, rate: value.doubleValue))
        }
    }
    
    public init(base: String, date: String, rates: [CurrencyRate]) {
        self.base = base
        self.baseValue = 1
        self.date = date
        self.rates = []
        self.rates.append(CurrencyRate(base: "EUR", rate: 1))
        self.rates.append(contentsOf: rates)
    }
    
    public func update(json: JSON) {
        self.date = json["date"].stringValue
        self.rates = self.rates.map({ r in
            guard json["rates"][r.base] != JSON.null else { return r }
            let rateValue = json["rates"][r.base].doubleValue
            return CurrencyRate(base: r.base, rate: rateValue)
        })
        updated!()
    }
    
    public func moveRateToFirstIndex(from i: Int) {
        self.baseValue = calculateRateValue(base: self.rates[i].base)
        self.base = self.rates[i].base
        self.rates.insert(self.rates[i], at: 0)
        self.rates.remove(at: i + 1)
    }
    
    public func isBase(_ base: String) -> Bool {
        return self.base == base
    }
      
    public func calculateRateValue(base: String) -> Double {
        
        let rate = self.rates.first(where: { $0.base == base })!
        let baseRate = self.rates.first(where: { $0.base == self.base })!

        let rateValue = baseValue / (baseRate.rate / rate.rate)
        return rateValue
    }
}
