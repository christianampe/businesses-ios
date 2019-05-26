//
//  HomeViewModelProtocol.swift
//  WeedmapsChallenge
//
//  Created Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

protocol HomeViewModelProtocol {
    var businesses: [BusinessCellViewModelProtocol] { get }
}

struct HomeViewModel: HomeViewModelProtocol {
    let businesses: [BusinessCellViewModelProtocol]
}
