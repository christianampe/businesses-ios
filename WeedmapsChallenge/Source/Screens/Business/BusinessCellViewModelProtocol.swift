//
//  BusinessCellViewModelProtocol.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol BusinessCellViewModelProtocol {
    var detail: String? { get }
    var imageURLString: String? { get }
}

struct BusinessCellViewModel: BusinessCellViewModelProtocol {
    let detail: String?
    let imageURLString: String?
}
