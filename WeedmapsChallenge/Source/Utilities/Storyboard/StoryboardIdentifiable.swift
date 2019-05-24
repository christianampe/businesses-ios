//
//  StoryboardIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 9/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

/// A protocol used for identifying views from storyboards.
protocol StoryboardIdentifiable {
    
    /// The identifier used to describe an object referenced from interface builder.
    static var storyboardIdentifier: String { get }
}
