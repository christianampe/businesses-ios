//
//  Networking.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//

import Foundation

protocol NetworkingProviderProtocol {
    associatedtype T: NetworkingRequest
    associatedtype R: NetworkingServiceResponseProtocol
    associatedtype E: Swift.Error
    
    func request(_ target: T, completion: @escaping (Result<R, E>) -> Void) -> URLSessionDataTask
}

// MARK: - Networking Class
class NetworkingProvider<T: NetworkingRequest> {
    
    /// Initialized provider holding reference
    /// to the innerworkings of the service layer.
    private let service = NetworkingService()
}

// MARK: - Internal API
extension NetworkingProvider: NetworkingProviderProtocol {
    
    /// Request method used for requesting any service supported network calls.
    ///
    /// - Parameters:
    ///     - target: Enum holding possible network requests.
    ///     - completion: Result returning either a parsed model or an error.
    @discardableResult
    func request(_ target: T,
                 completion: @escaping (Result<NetworkingService.Response, Error>) -> Void) -> URLSessionDataTask {
        
        // make request to specified target
        return service.request(target.urlRequest) { result in
            
            // switch on result of network request
            switch result {
                
            case .success(let response):
                
                // successful result
                completion(.success(response))
                
            case .failure(let error):
                
                // something went wrong with the network request
                completion(.failure(.service(error)))
            }
        }
    }
}
