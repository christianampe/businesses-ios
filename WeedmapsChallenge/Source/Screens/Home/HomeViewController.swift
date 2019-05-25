//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    private var searchController: HomeSearchViewController?
    
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

// MARK: - HomeSearchViewControllerDelegate
extension HomeViewController: HomeSearchViewControllerDelegate {
    func homeSearchViewController(_ homeSearchViewController: HomeSearchViewController,
                                  didSelectSearchResult searchResult: String) {
        
        // todo: fire off network request
    }
}
