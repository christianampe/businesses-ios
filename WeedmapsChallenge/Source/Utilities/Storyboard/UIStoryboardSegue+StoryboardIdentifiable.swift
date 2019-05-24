//
//  UIStoryboardSegue+StoryboardIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

extension UIStoryboardSegue: StoryboardIdentifiable {}

extension UIStoryboardSegue {
    
    /// Method used to implicitly extract the view controller's type from the segue's destination.
    ///
    /// - Returns: Typesafe instance of the destinations UIViewController.
    func viewController<T: UIViewController>() -> T {
        guard let viewController = destination as? T else {
            fatalError("Cannot segue to: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return viewController
    }
}
