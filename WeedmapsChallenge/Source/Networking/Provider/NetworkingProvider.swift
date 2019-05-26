//
//  Networking.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//

import Foundation

// MARK: - Networking Class
class NetworkingProvider<T: NetworkingRequest> {
    
    /// Initialized provider holding reference
    /// to the innerworkings of the service layer.
    private let service = NetworkingService()
}

// MARK: - Internal API
extension NetworkingProvider {
    
    /// Request method used for requesting any service supported network calls.
    ///
    /// - Parameters:
    ///     - target: Enum holding possible network requests.
    ///     - completion: Result returning either a parsed model or an error.
    func request(_ target: T,
                 completion: @escaping (Result<NetworkingService.Response, Error>) -> Void) {
        
        // make request to specified target
        service.request(target.urlRequest) { result in
            
            // switch on result of network request
            switch result {
                
            case .success(let response):
                
                // validate response status code from specified request
                guard target.validation.statusCodes.contains(response.response.statusCode) else {
                    
                    // invalid status code according to client
                    completion(.failure(.validation(response)))
                    return
                }
                
                // successful result
                completion(.success(response))
                
            case .failure(let error):
                
                // something went wrong with the network request
                completion(.failure(.service(error)))
            }
        }
    }
}
