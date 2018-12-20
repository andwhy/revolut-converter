//
//  Response.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 28/11/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

public enum Response {

    case success(Data)
    case error(_: Int?, _: Error?)
    case noData
 
    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let data = response.data else {
            self = .noData
            return
        }
        
        self = .success(data)
    }
    
}
