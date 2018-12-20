//
//  RequestProtocol.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 27/11/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

public protocol Request {
    
    var path : String { get }
    var method : HTTPMethod { get }
}

public extension Request {
    
    var method : HTTPMethod { return .get }
}
