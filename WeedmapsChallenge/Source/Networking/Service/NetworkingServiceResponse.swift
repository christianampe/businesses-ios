//
//  NetworkingServiceResponse.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol NetworkingServiceResponseProtocol {
    var data: Data { get }
    var request: URLRequest { get }
    var response: HTTPURLResponse { get }
}

extension NetworkingService {
    struct Response: NetworkingServiceResponseProtocol {
        
        /// Data returned from the network request.
        let data: Data
        
        /// URL request sent to server.
        let request: URLRequest
        
        /// HTTP url response returned from server.
        let response: HTTPURLResponse
        
        /// Explicit initializer.
        ///
        /// - Parameters:
        ///   - data: The data returned from the network request.
        ///   - request: The url request sent to server.
        ///   - response: The HTTP url response returned from server.
        init(data: Data,
             request: URLRequest,
             response: HTTPURLResponse) {
            
            self.data = data
            self.request = request
            self.response = response
        }
    }
}
