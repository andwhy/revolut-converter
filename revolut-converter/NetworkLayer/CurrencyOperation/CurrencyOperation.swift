//
//  CurrencyTask.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 28/11/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CurrencyOperation: JSONOperation<Currency> {
    
    private var timer: Timer?
    private var currency: Currency?
    
    public override init() {
        super.init()
        self.parseResponse = { [unowned self] json in
            if self.currency != nil {
                self.currency?.update(json: json)
                return self.currency
            } else {
                return Currency.init(json)
            }
        }
        self.request = CurrencyRequest()
    }
    
    public func executeRepeatedly(in dispatcher: Dispatcher, completition: @escaping (_ result: Currency?, _ status: OperationStatus) -> Void) {
        let timeInterval = TimeInterval(10.0)
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { [unowned self] _ in
            self.execute(in: dispatcher, completition: { currency, status in
                if status == .success && self.currency != nil {
                    completition(nil, .updated)
                    return
                }
                self.currency = currency
                completition(currency, status)
            })
        })
        timer?.fire()
    }

}
