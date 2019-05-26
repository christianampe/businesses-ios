//
//  NetworkingRequest.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

// MARK: - Network Request Protocol
protocol NetworkingRequest {
    
    /// The target's base url.
    var baseURL: URL { get }
    
    /// The http method used in the request.
    var method: NetworkingRequestHTTPMethod { get }
    
    /// The path to be appended to base url to form the full url.
    var path: String { get }
    
    /// The parameters to be appended to the full formed url.
    var parameters: [String: String]? { get }
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
    
    // TODO: include body implementation
}

// MARK: - Public Constructor
extension NetworkingRequest {
    
    /// URL request constructed from the object.
    var urlRequest: URLRequest {
        
        // construct url request from base url
        var urlRequest = URLRequest(url: baseURL)
        
        // add http method type
        addMethod(method, to: &urlRequest)
        
        // add path to url request
        addPath(path, to: &urlRequest)
        
        // add url components
        addQueryParameters(parameters, to: &urlRequest)
        
        // add headers to url request
        addHeaders(headers, to: &urlRequest)
        
        // return construct request
        return urlRequest
    }
}

// MARK: - Private Request Constructor Helpers
private extension NetworkingRequest {
    
    /// Adds the http method type to the request.
    ///
    /// - Parameters:
    ///   - method: HTTP method to be executed.
    ///   - request: Inout url request being constructed.
    func addMethod(_ method: NetworkingRequestHTTPMethod,
                   to request: inout URLRequest) {
        
        request.httpMethod = method.name
    }
    
    /// Appends the given path to the request url.
    ///
    /// - Parameters:
    ///   - path: URL endpoint path to be added to the base url.
    ///   - request: Inout url request being constructed.
    func addPath(_ path: String,
                 to request: inout URLRequest) {
        
        request.url?.appendPathComponent(path)
    }
    
    /// Encodes and appends the given request parameters to the request url.
    ///
    /// - Parameters:
    ///   - parameters: Parameters to be added to the url query.
    ///   - request: Inout url request being constructed.
    func addQueryParameters(_ parameters: [String: String]?,
                            to request: inout URLRequest) {
        
        guard let parameters = parameters, let requestURL = request.url else {
            return
        }
        
        let items = parameters.map { URLQueryItem(name: $0, value: $1) }
        
        var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
        
        urlComponents?.queryItems = items
        
        request.url = urlComponents?.url
    }
    
    /// Adds given headers to the request.
    ///
    /// - Parameters:
    ///   - headers: Headers to be added to the http header field.
    ///   - request: Inout url request being constructed.
    func addHeaders(_ headers: [String: String]?,
                    to request: inout URLRequest) {
        
        guard let headers = headers else {
            return
        }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
