//
//  Operation.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 27/11/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

public protocol Operation {
    associatedtype Output

    var request: Request? { get set }
    
    func execute(in dispatcher: Dispatcher, completition: @escaping (_ result: Output, _ status: OperationStatus) -> Void)
}

public enum OperationStatus {
    case success
    case error
    case updated
}

