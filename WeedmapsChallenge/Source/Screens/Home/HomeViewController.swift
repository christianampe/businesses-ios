//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    private var searchController = UISearchController(searchResultsController: nil)
    private var searchDataTask: URLSessionDataTask?
    private var viewModel: HomeViewModelProtocol?
}

// MARK: - Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Setup Methods
private extension HomeViewController {
    func configure() {
        navigationItem.searchController = searchController
    }
}

// MARK: - UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // IMPLEMENT: Be sure to consider things like network errors
        // and possible rate limiting from the Yelp API. If the user types
        // very quickly, how will you prevent unnecessary requests from firing
        // off? Be sure to leverage the searchDataTask and use it wisely!
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        // IMPLEMENT:
        // 1a) Present the user with a UIAlertController (action sheet style) with options
        // to either display the Business's Yelp page in a WKWebView OR bump the user out to
        // Safari. Both options should display the Business's Yelp page details
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        // IMPLEMENT:
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // IMPLEMENT:
        return UICollectionViewCell()
    }
}
