//
//  YelpNetworking.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol YelpNetworkingProtocol: class {
    associatedtype E: Swift.Error
    
    func autocomplete(for text: String,
                      _ completion: @escaping (Result<Yelp.Networking.Responses.Autocomplete, E>) -> Void)
    
    func businessesSearch(for text: String,
                          with offset: Int,
                          _ completion: @escaping (Result<Yelp.Networking.Responses.BusinessesSearch, E>) -> Void)
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
        
        provider.request(.autocomplete(text: text, latitude: 33.646942, longitude: -117.686104)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    
                    // successful result with parsed object
                    completion(.success((try self.jsonDecoder.decode(Yelp.Networking.Responses.Autocomplete.self, from: response.data))))
                } catch {
                    
                    // unexpected data returned
                    completion(.failure(.mapping))
                }
            case .failure(let error):
                switch error {
                case .service(let error):
                    completion(.failure(.service(error)))
                }
            }
        }
    }
    
    func businessesSearch(for text: String,
                          with offset: Int,
                          _ completion: @escaping (Result<Yelp.Networking.Responses.BusinessesSearch, Error>) -> Void) {
        
        provider.request(.businessSearch(text: text, latitude: 33.646942, longitude: -117.686104, offset: offset)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    
                    // successful result with parsed object
                    completion(.success((try self.jsonDecoder.decode(Yelp.Networking.Responses.BusinessesSearch.self, from: response.data))))
                } catch {
                    
                    // unexpected data returned
                    completion(.failure(.mapping))
                }
            case .failure(let error):
                switch error {
                case .service(let error):
                    completion(.failure(.service(error)))
                }
            }
        }
    }
}
