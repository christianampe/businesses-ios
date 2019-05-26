//
//  HomeInteractor.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/26/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation

protocol HomeInteractorProtocol: class {
    var view: HomeViewControllerProtocol? { get set }
    
    func fetchAutocomplete(for text: String)
    func fetchBusinesses(for text: String)
}

class HomeInteractor: HomeInteractorProtocol {
    private lazy var yelpProvider = Yelp.Networking()
    private var recentSearches: [String] = []
    private var searchOffset: Int = 0
    
    weak var view: HomeViewControllerProtocol?
}

extension HomeInteractor {
    func fetchAutocomplete(for text: String) {
        yelpProvider.autocomplete(for: text) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    guard let titles = (response.categories?.compactMap { $0.title }) else {
                        return
                    }
                    
                    let viewModel = HomeSearchResultsViewModel(recentSearches: self?.recentSearches ?? [],
                                                               autocompleteSearches: titles)
                    
                    self?.view?.displayAutocomplete(viewModel)
                    
                case .failure:
                    break
                }
            }
        }
    }
    
    func fetchBusinesses(for text: String) {
        yelpProvider.businessesSearch(for: text, with: searchOffset) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    let viewModels = response.businesses?.map { (business) -> HomeBusinessViewModel in
                        let description = "\(business.name ?? "no name")\n\(business.displayPhone ?? "no phone number provided")"
                        return HomeBusinessViewModel(name: business.name,
                                                     detail: description,
                                                     imageURLString: business.imageUrl,
                                                     websiteURLString: business.url)
                    }
                    
                    let viewModel = HomeViewModel(businesses: viewModels ?? [])
                    
                    self?.view?.displayBusinesses(viewModel)
                    
                case .failure:
                    break
                }
            }
        }
    }
}
