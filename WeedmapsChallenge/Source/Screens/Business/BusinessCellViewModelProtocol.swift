//
//  BusinessCellViewModelProtocol.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol BusinessCellViewModelProtocol {
    var imageURLString: String? { get }
    var detail: String? { get }
}

struct BusinessCellViewModel: BusinessCellViewModelProtocol {
    let imageURLString: String?
    let detail: String?
}
