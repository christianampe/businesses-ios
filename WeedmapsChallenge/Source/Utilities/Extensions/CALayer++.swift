//
//  CALayer++.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/26/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

extension CALayer {
    func round() {
        cornerRadius = frame.width / 2
        masksToBounds = true
    }
}
