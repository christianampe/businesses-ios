//
//  HomeSearchResultsCell.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/23/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import UIKit

class HomeSearchResultsCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
}

// MARK: - Lifecycle
extension HomeSearchResultsCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }
}

// MARK: - Public API
extension HomeSearchResultsCell {
    func configure(with result: String) {
        titleLabel.text = result
    }
}

// MARK: - Helper Methods
private extension HomeSearchResultsCell {
    func reset() {
        titleLabel.text = nil
    }
}
