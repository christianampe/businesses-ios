//
//  UIStoryboard+Identifiers.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

// MARK: - Storyboard Conformance
extension UIStoryboard {
    enum Storyboard: String {
        case home = "Home"
        case homeDetail = "HomeDetail"
        case homeSearchResults = "HomeSearchResults"
        case favorites = "Favorites"
    }
}

// MARK: - Convenience Initializers
extension UIStoryboard {
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
}

// MARK: - Class Functions
extension UIStoryboard {
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}
