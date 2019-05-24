//
//  StoryboardIdentifiable+Self.swift
//  Client
//
//  Created by Christian Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension StoryboardIdentifiable where Self: UITableViewCell {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension StoryboardIdentifiable where Self: UIStoryboardSegue {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension StoryboardIdentifiable where Self: UICollectionReusableView {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
