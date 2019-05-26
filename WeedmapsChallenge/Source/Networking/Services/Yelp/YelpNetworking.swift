//
//  YelpNetworking.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol YelpNetworkingProtocol: class {
    static func autocomplete(for text: String,
                             _ completion: @escaping (Result<Yelp.Networking.Responses.Autocomplete, Error>) -> Void)
    
    static func businessesSearch(for text: String,
                                 _ completion: @escaping (Result<Yelp.Networking.Responses.BusinessesSearch, Error>) -> Void)
}

extension Yelp {
    class Networking: YelpNetworkingProtocol {
        private static let provider = NetworkingProvider<Yelp.Networking.Target>()
        private static let jsonDecoder = JSONDecoder()
    }
}

extension Yelp.Networking {
    static func autocomplete(for text: String,
                             _ completion: @escaping (Result<Yelp.Networking.Responses.Autocomplete, Error>) -> Void) {
        
        provider.request(.businessSearch) { result in
            switch result {
            case .success(let response):
                
            case .failure(let error):
                
            }
        }
    }
    
    static func businessesSearch(for text: String,
                                 _ completion: @escaping (Result<Yelp.Networking.Responses.BusinessesSearch, Error>) -> Void) {
        
        provider.request(.businessSearch) { result in
            switch result {
            case .success(let response):
                
            case .failure(let error):
                
            }
        }
    }
}
