//
//  NetworkDispatcher.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 27/11/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

public class NetworkDispatcher: Dispatcher {
    
    private var environment: Environment
    private var session: URLSession

    required public init(environment: Environment) {
        
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    public func execute(request: Request, completition: @escaping (_ result: Response) -> Void) {

        guard let urlRequest = try? self.prepareURLRequest(for: request) else {
            completition(.noData)
            return
        }

        let d = self.session.dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
            let response = Response((urlResponse as? HTTPURLResponse,data,error), for: request)
            completition(response)
        })
        d.resume()
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {

        let full_url = "\(environment.host)/\(request.path)"
        var url_request = URLRequest(url: URL(string: full_url)!)
        url_request.httpMethod = request.method.rawValue
        
        return url_request
    }
}
