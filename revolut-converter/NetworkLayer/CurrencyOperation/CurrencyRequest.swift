//
//  CurrencyRequest.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 28/11/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

public struct CurrencyRequest: Request {
    
    public var path: String = "latest?base=EUR"
}
