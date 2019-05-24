//
//  UIStoryboard+StoryboardIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    /// Instantiates and returns the view controller with the specified type.
    ///
    /// - Returns: The view controller corresponding to the specified identifier string. If no view controller is associated with the type, this method throws an exception.
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
