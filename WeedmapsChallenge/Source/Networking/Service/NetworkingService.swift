//
//  NetworkingService.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class NetworkingService {
    
    /// URL session used to make all network requests.
    private let session = URLSession(configuration: .default)
}

extension NetworkingService {
    
    /// Core method for making a network request.
    ///
    /// - Parameters:
    ///   - request: A request object containing all information necessary for making a network request.
    ///   - completion: Returns a generic result containing either an error or successful response.
    func request(_ request: URLRequest,
                 completion: @escaping (Result<Response, Error>) -> Void) {
        
        // make network request utilizing Apple's API
        session.dataTask(with: request) { data, response, error in
            
            // ensure the response exists and is an HTTPURLResponse
            guard let response = response as? HTTPURLResponse else {
                
                // server did not responsd to request
                completion(.failure(.unresponsive))
                return
            }
            
            // if there is an error this means the request failed
            if let error = error {
                
                // something went wrong and no data will be returned
                completion(.failure(.underlying(error)))
                
            } else if let data = data {
                
                // if there is data map it into a NetworkingResponse
                completion(.success(Response(data: data,
                                             request: request,
                                             response: response)))
            }
            
        // resume execution
        }.resume()
    }
}
