//
//  YelpNetworkingTarget.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

extension Yelp.Networking {
    enum Target: NetworkingRequest {
        case autocomplete(text: String, latitude: Double, longitude: Double)
        case businessSearch(text: String, latitude: Double, longitude: Double, offset: Int)
    }
}

extension Yelp.Networking.Target {
    var baseURL: URL {
        switch self {
        case .autocomplete:
            return URL(string: "https://api.yelp.com/v3")!
        case .businessSearch:
            return URL(string: "https://api.yelp.com/v3")!
        }
    }
    
    var path: String {
        switch self {
        case .autocomplete:
            return "/autocomplete"
        case .businessSearch:
            return "/businesses/search"
        }
    }
    
    var parameters: [String : String]? {
        switch self {
        case .autocomplete(let text, let lat, let long):
            return ["text": text,
                    "latitude": "\(lat)",
                    "longitude": "\(long)"]
        case .businessSearch(let text, let lat, let long, let offset):
            return ["term": text,
                    "latitude": "\(lat)",
                    "longitude": "\(long)",
                    "limit": "\(15)",
                    "offset": "\(offset)"]
        }
    }
    
    var method: NetworkingRequestHTTPMethod {
        switch self {
        case .autocomplete:
            return .get
        case .businessSearch:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .autocomplete:
            return ["Authorization": "Bearer aQoSlJ_RG2cdaAjYOv4vWEMaJyS4kGWKcHaMbsCRLYWNvg-0Ms56bQj7QCO-aQoydqhI1dUQLGaddtln8VzGAiUTQldRTGE_qtA4qSHTkjuO7dGZ27RL4K6X5mjnXHYx"]
        case .businessSearch:
            return ["Authorization": "Bearer aQoSlJ_RG2cdaAjYOv4vWEMaJyS4kGWKcHaMbsCRLYWNvg-0Ms56bQj7QCO-aQoydqhI1dUQLGaddtln8VzGAiUTQldRTGE_qtA4qSHTkjuO7dGZ27RL4K6X5mjnXHYx"]
        }
    }
    
    var validation: NetworkingRequestValidation {
        switch self {
        case .autocomplete:
            return .none
        case .businessSearch:
            return .none
        }
    }
}
