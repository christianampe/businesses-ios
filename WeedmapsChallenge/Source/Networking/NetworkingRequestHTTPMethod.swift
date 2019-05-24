//
//  NetworkingRequestHTTPMethod.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

enum NetworkingRequestHTTPMethod: String {
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.1
    case get
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.2
    case head
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.3
    case post
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.4
    case put
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.5
    case delete
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.6
    case connect
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.7
    case options
    
    /// https://tools.ietf.org/html/rfc7231#section-4.3.8
    case trace
}

extension NetworkingRequestHTTPMethod {
    
    /// Uppercased representation of the method name.
    var name: String {
        return rawValue.uppercased()
    }
}
