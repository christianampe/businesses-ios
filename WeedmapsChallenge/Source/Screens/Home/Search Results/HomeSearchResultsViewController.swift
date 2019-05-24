//
//  HomeSearchResultsViewController.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

protocol HomeSearchResultsViewControllerDataSource: class {
    
}

protocol HomeSearchResultsViewControllerDelegate: class {
    
}

class HomeSearchResultsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomeSearchResultsViewModelProtocol?
    
    weak var dataSource: HomeSearchResultsViewControllerDataSource?
    weak var delegate: HomeSearchResultsViewControllerDelegate?
}

extension HomeSearchResultsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

private extension HomeSearchResultsViewController {
    func configure() {
        
    }
}

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

extension HomeSearchResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? HomeSearchResultsCell else {
            assertionFailure("incorrect cell used")
            return
        }
    }
}
