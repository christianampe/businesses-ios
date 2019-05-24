//
//  UICollectionView+StoryboardIdentifiable.swift
//  Client
//
//  Created by Christian Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    /// Returns a reusable table-view cell object for the specified UITableViewCell type and adds it to the table.
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell. The data source receives this information when it is asked for the cell and should just pass it along. This method uses the index path to perform additional configuration based on the cell’s position in the table view.
    /// - Returns: A UICollectionViewCell object with the associated type. If no UICollectionViewCell is associated with the type, this method throws an exception.
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.storyboardIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return cell
    }
    
    /// Returns a reusable table-view cell object for the specified UITableViewCell type and adds it to the table.
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell. The data source receives this information when it is asked for the cell and should just pass it along. This method uses the index path to perform additional configuration based on the cell’s position in the table view.
    /// - Returns: A UICollectionReusableView object with the associated type. If no UICollectionReusableView is associated with the type, this method throws an exception.
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.storyboardIdentifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return view
    }
    
    /// Register a nib file for use in creating new collection view cells.
    ///
    /// - Parameter xibCell: The type of the UICollectionViewCell to be registerd.
    func registerCollectionViewCell<T: UICollectionViewCell>(xibCell: T.Type) {
        register(UINib(nibName: T.storyboardIdentifier, bundle: nil), forCellWithReuseIdentifier: T.storyboardIdentifier)
    }
    
    /// Registers a nib file for use in creating UICollectionReusableView for the collection view.
    ///
    /// - Parameter xibCell: The type of the UICollectionReusableView to be registerd.
    func registerReusableHeaderView<T: UICollectionReusableView>(xibCell: T.Type) {
        register(UINib(nibName: T.storyboardIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.storyboardIdentifier)
    }
}
