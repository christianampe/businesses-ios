//
//  HomeSearchResultsViewModelProtocol.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol HomeSearchResultsViewModelProtocol {
    var recentSearches: [String] { get }
    var autocompleteSearches: [String] { get }
}
