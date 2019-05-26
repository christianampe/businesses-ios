//
//  NetworkingServiceError.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

extension NetworkingService {
    enum Error: Swift.Error {
        
        /// Returned when no response is returned from the server.
        case unresponsive
        
        /// Returned when the data task returns an error.
        case underlying(Swift.Error)
    }
}
