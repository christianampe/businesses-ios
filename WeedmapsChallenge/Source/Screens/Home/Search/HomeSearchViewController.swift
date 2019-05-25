//
//  HomeSearchViewController.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/25/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

protocol HomeSearchViewControllerDelegate: class {
    func homeSearchViewController(_ homeSearchViewController: HomeSearchViewController,
                                  didSelectSearchResult searchResult: String)
}

extension HomeSearchViewControllerDelegate {
    func homeSearchViewController(_ homeSearchViewController: HomeSearchViewController,
                                  didSelectSearchResult searchResult: String) {}
}

class HomeSearchViewController: UIViewController {
    private var searchResultsViewController: HomeSearchResultsViewController?
    private var searchController: UISearchController?
    
    var delegate: HomeSearchViewControllerDelegate?
}

// MARK: - Lifecycle
extension HomeSearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Helper Methods
private extension HomeSearchViewController {
    func configure() {
        let searchResultsViewController: HomeSearchResultsViewController = UIStoryboard(storyboard: .homeSearchResults).instantiateViewController()
        let searchController = UISearchController(searchResultsController: searchResultsViewController)
        
        searchResultsViewController.delegate = self
        searchController.searchBar.delegate = self
        
        self.searchResultsViewController = searchResultsViewController
        self.searchController = searchController
    }
}

// MARK: - UISearchResultsUpdating
extension HomeSearchViewController: UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        // todo: fire off network request for a list of suggested searches
    }
}

// MARK: - UISearchBarDelegate
extension HomeSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

// MARK: - HomeSearchResultsViewControllerDelegate
extension HomeSearchViewController: HomeSearchResultsViewControllerDelegate {
    func homeSearchResultsViewController(_ homeSearchResultsViewController: HomeSearchResultsViewController,
                                         didSelectSearchResult searchResult: String) {
        
        delegate?.homeSearchViewController(self,
                                           didSelectSearchResult: searchResult)
    }
}
