//
//  JSONOperation.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 02/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation
import SwiftyJSON

open class JSONOperation<Output> : Operation {
    
    typealias Operation = JSON
    
    public var request: Request?
    
    public var parseResponse: ((JSON) -> (Output?))? = nil
    
    public init() {
        self.parseResponse = { _ in
            fatalError("You must implement .parseResponse in JSONOperation subclass")
        }
    }
    
    public func execute(in dispatcher: Dispatcher, completition: @escaping (Output?, OperationStatus) -> Void) {
        guard let request = request else {
            completition(nil, .error)
            return
        }
        dispatcher.execute(request: request, completition: { response in
            
            switch response {
            case .success(let data):
                let json = JSON(data)
                
                guard let parsedObj = self.parseResponse!(json) else {
                    completition(nil, .error)
                    return
                }
                completition(parsedObj, .success)
            case .error(_, _):
                completition(nil, .error)
            case .noData:
                completition(nil, .error)
            }
            
        })
    }
}
