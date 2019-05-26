//
//  HomeSearchResultsViewController.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

protocol HomeSearchResultsViewControllerDelegate: class {
    func homeSearchResultsViewController(_ homeSearchResultsViewController: HomeSearchResultsViewController,
                                         didSelectSearchResult searchResult: String)
}

extension HomeSearchResultsViewControllerDelegate {
    func homeSearchResultsViewController(_ homeSearchResultsViewController: HomeSearchResultsViewController,
                                         didSelectSearchResult searchResult: String) {}
}


class HomeSearchResultsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomeSearchResultsViewModelProtocol?
    
    var delegate: HomeSearchResultsViewControllerDelegate?
}

// MARK: - Public API
extension HomeSearchResultsViewController {
    func set(properties newViewModel: HomeSearchResultsViewModelProtocol) {
        viewModel = newViewModel
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeSearchResultsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return viewModel?.recentSearches.count ?? 0
        case 1:
            return viewModel?.autocompleteSearches.count ?? 0
        default:
            assertionFailure("unexpected number of sections")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(for: indexPath) as HomeSearchResultsCell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Recent Searches"
        case 1:
            return "Yelp Autocomplete"
        default:
            assertionFailure("unexpected number of sections")
            return "Error"
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeSearchResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? HomeSearchResultsCell else {
            assertionFailure("incorrect cell used")
            return
        }
        
        switch indexPath.section {
        case 0:
            guard let viewModel = viewModel?.recentSearches[indexPath.row] else {
                return
            }
            
            cell.configure(with: viewModel)
        case 1:
            guard let viewModel = viewModel?.autocompleteSearches[indexPath.row] else {
                return
            }
            
            cell.configure(with: viewModel)
        default:
            assertionFailure("unexpected number of sections")
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        guard let searchResult = viewModel?.autocompleteSearches[indexPath.row] else {
            return
        }
        
        delegate?.homeSearchResultsViewController(self,
                                                  didSelectSearchResult: searchResult)
    }
}
