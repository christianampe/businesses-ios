//
//  HomeSearchResultsViewController.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

class HomeSearchResultsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomeSearchResultsViewModelProtocol?
}

// MARK: - Lifecycle
extension HomeSearchResultsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Public API
extension HomeSearchResultsViewController {
    func set(properties newViewModel: HomeSearchResultsViewModelProtocol) {
        viewModel = newViewModel
        tableView.reloadData()
    }
}

// MARK: - Helper Methods
private extension HomeSearchResultsViewController {
    func configure() {
        
    }
}

// MARK: - UITableViewDataSource
extension HomeSearchResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.autocompleteSearches.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(for: indexPath) as HomeSearchResultsCell
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
        
        guard let viewModel = viewModel else {
            return
        }
        
    }
}
