//
//  YelpNetworkingResponses.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

extension Yelp.Networking {
    class Responses {
        struct Autocomplete: Decodable {
            let terms: [Term]?
            let businesses: [Business]?
            let categories: [Category]?
        }
        
        struct BusinessesSearch: Decodable {
            let businesses: [Business]?
            let total: Int?
        }
    }
}

extension Yelp.Networking.Responses.Autocomplete {
    struct Term: Decodable {
        let text: String?
    }
    
    struct Business: Decodable {
        let name: String?
        let id: String?
    }
    
    struct Category: Decodable {
        let alias: String?
        let title: String?
    }
}

extension Yelp.Networking.Responses.BusinessesSearch {
    struct Business: Decodable {
        let categories: [Category]?
        let coordinates: Coordinates?
        let displayPhone: String?
        let distance: Double?
        let id: String?
        let alias: String?
        let imageUrl: String?
        let isClosed: Bool?
        let location: Location?
        let name: String?
        let phone: String?
        let price: String?
        let rating: Double?
        let reviewCount: Int?
        let url: String?
        let transactions: [Transaction]?
    }
}

extension Yelp.Networking.Responses.BusinessesSearch.Business {
    struct Category: Decodable {
        let alias: String?
        let title: String?
    }
    
    struct Coordinates: Codable, Equatable {
        let latitude: Double?
        let longitude: Double?
    }
    
    struct Location: Codable, Equatable {
        let address1: String?
        let address2: String?
        let address3: String?
        let city: String?
        let country: String?
        let displayAddress: [String]?
        let state: String?
        let zipCode: String?
    }
    
    enum Transaction: String, Decodable {
        case pickup
        case delivery
        case restaurantReservation
    }
}
