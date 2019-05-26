//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    private var searchController: UISearchController?
    private var searchResultsViewController: HomeSearchResultsViewController?
    
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
        let searchResultsViewController: HomeSearchResultsViewController = UIStoryboard(storyboard: .homeSearchResults).instantiateViewController()
        let searchController = UISearchController(searchResultsController: searchResultsViewController)
        
        searchResultsViewController.delegate = self
        searchController.searchBar.delegate = self
        
        self.searchResultsViewController = searchResultsViewController
        self.searchController = searchController
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        collectionView.registerCollectionViewCell(xibCell: BusinessCell.self)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.businesses.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(for: indexPath) as BusinessCell
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? BusinessCell else {
            assertionFailure("incorrect cell type used")
            return
        }
        
        guard let viewModel = viewModel?.businesses[indexPath.row] else {
            return
        }
        
        cell.configure(with: viewModel)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        // todo: show detail screen
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y >= 0 else {
            return
        }
        
        guard scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height) else {
            return
        }
        
        // todo: fetch more items
    }
}

// MARK: - UISearchResultsUpdating
extension HomeViewController: UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        // todo: fire off network request for a list of suggested searches
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

// MARK: - HomeSearchViewControllerDelegate
extension HomeViewController: HomeSearchResultsViewControllerDelegate {
    func homeSearchResultsViewController(_ homeSearchResultsViewController: HomeSearchResultsViewController,
                                         didSelectSearchResult searchResult: String) {
        
        // todo: fire off network request
    }
}
