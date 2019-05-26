//
//  YelpNetworking.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol YelpNetworkingProtocol: class {
    func autocomplete(for text: String,
                      _ completion: @escaping (Result<Yelp.Networking.Responses.Autocomplete, Error>) -> Void)
    
    func businessesSearch(for text: String,
                          _ completion: @escaping (Result<Yelp.Networking.Responses.BusinessesSearch, Error>) -> Void)
}

extension Yelp {
    class Networking: YelpNetworkingProtocol {
        private let provider = NetworkingProvider<Yelp.Networking.Target>()
        private var jsonDecoder: JSONDecoder = {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return jsonDecoder
        }()
    }
}

extension Yelp.Networking {
    func autocomplete(for text: String,
                      _ completion: @escaping (Result<Yelp.Networking.Responses.Autocomplete, Error>) -> Void) {
        
        provider.request(.businessSearch) { result in
            switch result {
            case .success(let response):
                
            case .failure(let error):
                
            }
        }
    }
    
    func businessesSearch(for text: String,
                          _ completion: @escaping (Result<Yelp.Networking.Responses.BusinessesSearch, Error>) -> Void) {
        
        provider.request(.businessSearch) { result in
            switch result {
            case .success(let response):
                
            case .failure(let error):
                
            }
        }
    }
}
