//
//  DispatcherProtocol.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 27/11/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

public protocol Environment {
    
    var host: String { get }
}

public protocol Dispatcher {
    
    init(environment: Environment)
    
    func execute(request: Request, completition: @escaping (_ result: Response) -> Void)
}
