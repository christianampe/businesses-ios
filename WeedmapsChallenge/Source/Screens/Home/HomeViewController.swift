//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    private var searchController: UISearchController?
    private var searchResultsViewController: HomeSearchResultsViewController?
    
    private lazy var yelpProvider = Yelp.Networking()
   
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
        searchController.searchResultsUpdater = self
        
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
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        yelpProvider.autocomplete(for: searchText) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    guard let titles = (response.categories?.compactMap { $0.title }) else {
                        return
                    }
                    
                    let viewModel = HomeSearchResultsViewModel(recentSearches: [],
                                                               autocompleteSearches: titles)
                    
                    self?.searchResultsViewController?.set(properties:  viewModel)
                    
                case .failure(let error):
                    break
                }
            }
        }
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
        
        yelpProvider.businessesSearch(for: searchResult) { [weak self] result in
            DispatchQueue.main.async {
                self?.searchController?.isActive = false
                
                switch result {
                case .success(let response):
                    guard let businesses = response.businesses else {
                        return
                    }
                    
                    let viewModels = response.businesses?.map { BusinessCellViewModel(imageURLString: $0.imageUrl,
                                                                                      detail: "\($0.name ?? "no name")\n\($0.displayPhone ?? "no phone")\n\($0.distance ?? -1)mi")
                    }
                    
                    let viewModel = HomeViewModel(businesses: viewModels ?? [])
                    
                    self?.viewModel = viewModel
                    self?.collectionView.reloadData()
                    
                case .failure(let error):
                    break
                }
            }
        }
    }
}
