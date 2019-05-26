//
//  NetworkingRequestValidationCode.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

enum NetworkingRequestValidation {
    
    /// No validation.
    case none
    
    /// Validate success codes (only 2xx).
    case successCodes
    
    /// Validate success codes and redirection codes (only 2xx and 3xx).
    case successAndRedirectCodes
    
    /// Validate only the given status codes.
    case customCodes([Int])
}

extension NetworkingRequestValidation {
    
    /// The list of HTTP status codes to validate.
    var statusCodes: [Int] {
        switch self {
        case .none:
            return []
        case .successCodes:
            return Array(200..<300)
        case .successAndRedirectCodes:
            return Array(200..<400)
        case .customCodes(let codes):
            return codes
        }
    }
}
