//
//  HomeSearchViewController.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

protocol HomeSearchViewControllerDataSource: class {
    
}

protocol HomeSearchViewControllerDelegate: class {
    
}

class HomeSearchViewController: UIViewController {
    private var searchController: UISearchController?
    private var searchResultsViewController: HomeSearchResultsViewController?
    
    var dataSource: HomeSearchViewControllerDataSource?
    var delegate: HomeSearchViewControllerDelegate?
}

// MARK: - Lifecycle
extension HomeSearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Helper Methods
private extension HomeSearchViewController {
    func configure() {
        
    }
}

// MARK: - UISearchResultsUpdating
extension HomeSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

// MARK: - UISearchBarDelegate
extension HomeSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension HomeSearchViewController {
    
}
