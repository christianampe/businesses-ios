//
//  YelpNetworkingError.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/26/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

extension Yelp.Networking {
    enum Error: Swift.Error {
        case mapping
        case service(NetworkingService.Error)
    }
}
