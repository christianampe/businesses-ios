//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: class {
    var interactor: HomeInteractorProtocol? { get set }
    
    func displayAutocomplete(_ results: HomeSearchResultsViewModelProtocol)
    func displayBusinesses(_ businesses: HomeViewModelProtocol)
}

class HomeViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    private var searchController: UISearchController?
    private var searchResultsViewController: HomeSearchResultsViewController?
    
    private var businessesViewModel: HomeViewModelProtocol?
    
    var interactor: HomeInteractorProtocol?
}

// MARK: - HomeViewControllerProtocol
extension HomeViewController: HomeViewControllerProtocol {
    func displayAutocomplete(_ results: HomeSearchResultsViewModelProtocol) {
        if let isActive = searchController?.isActive, !isActive {
            searchController?.isActive = true
        }

        searchResultsViewController?.set(properties: results)
    }
    
    func displayBusinesses(_ businesses: HomeViewModelProtocol) {
        if let isActive = searchController?.isActive, isActive {
            searchController?.isActive = false
        }
        
        businessesViewModel = businesses
        collectionView.reloadData()
    }
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
        let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let interactor = HomeInteractor()
        
        searchResultsViewController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        interactor.view = self
        
        self.searchResultsViewController = searchResultsViewController
        self.searchController = searchController
        self.interactor = interactor
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        collectionView.registerCollectionViewCell(xibCell: BusinessCell.self)
        
        flowLayout?.itemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout?.estimatedItemSize = CGSize(width: (collectionView.frame.width / 2) - 20, height: 100)
        
        LocationManager.requestAccess()
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return businessesViewModel?.businesses.count ?? 0
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
        
        guard let viewModel = businessesViewModel?.businesses[indexPath.row] else {
            return
        }
        
        cell.configure(with: viewModel)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        guard let business = businessesViewModel?.businesses[indexPath.row], let websiteURLString = business.websiteURLString else {
            return
        }
        
        let alertController = actionSheet(for: business.name,
                                          at: websiteURLString)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = collectionView.cellForItem(at: indexPath)
            popoverController.sourceRect = collectionView.cellForItem(at: indexPath)?.bounds ?? collectionView.bounds
        }
        
        present(alertController, animated: true)
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
        
        interactor?.fetchBusinesses(for: nil)
    }
}

// MARK: - UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        interactor?.fetchAutocomplete(for: searchText)
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        
        interactor?.fetchAutocomplete(for: searchText)
    }
}

// MARK: - HomeSearchViewControllerDelegate
extension HomeViewController: HomeSearchResultsViewControllerDelegate {
    func homeSearchResultsViewController(_ homeSearchResultsViewController: HomeSearchResultsViewController,
                                         didSelectSearchResult searchResult: String) {
        
        interactor?.fetchBusinesses(for: searchResult)
    }
}

// MARK: - Action Sheet
private extension HomeViewController {
    func actionSheet(for businessName: String?, at urlString: String) -> UIAlertController {
        let title = businessName ?? "Business Website"
        let message = "How would you like to open the website?"
        
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(cancelAction)
        
        guard let webURL = URL(string: urlString) else {
            actionSheet.message = "This website cannot be opened current."
            return actionSheet
        }
        
        let safariAction = UIAlertAction(title: "Open in Safari", style: .default) { _ in
            UIApplication.shared.open(webURL)
        }
        
        let webViewAction = UIAlertAction(title: "Open in WebView", style: .default) { [weak self] _ in
            let storyboard = UIStoryboard(storyboard: .homeDetail)
            let detailViewController: HomeDetailViewController = storyboard.instantiateViewController()
            
            detailViewController.configure(with: webURL)
            
            self?.navigationController?.pushViewController(detailViewController, animated: true)
        }
        
        actionSheet.addAction(safariAction)
        actionSheet.addAction(webViewAction)
        
        return actionSheet
    }
}
