//
//  HomeViewModelProtocol.swift
//  WeedmapsChallenge
//
//  Created Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

protocol HomeViewModelProtocol {
    var businesses: [HomeBusinessViewModelProtocol] { get }
}

struct HomeViewModel: HomeViewModelProtocol {
    let businesses: [HomeBusinessViewModelProtocol]
}

protocol HomeBusinessViewModelProtocol: BusinessCellViewModelProtocol {
    var name: String? { get }
    var detail: String? { get }
    var imageURLString: String? { get }
    var websiteURLString: String? { get }
}

struct HomeBusinessViewModel: HomeBusinessViewModelProtocol {
    let name: String?
    let detail: String?
    let imageURLString: String?
    let websiteURLString: String?
}
