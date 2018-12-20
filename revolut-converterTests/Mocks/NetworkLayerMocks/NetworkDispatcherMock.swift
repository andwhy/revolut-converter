//
//  NetworkDispatcherMock.swift
//  revolut-converterTests
//
//  Created by Андрей Рожков on 05/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation
@testable import revolut_converter

class NetworkDispatcherMock: Dispatcher {
    
    private var environment: Environment
    public var result: Response?
    
    required public init(environment: Environment) {
        
        self.environment = environment
    }
    
    public func execute(request: Request, completition: @escaping (_ result: Response) -> Void) {
        
        completition(result!)
    }

}
