//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit

class BusinessCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var viewModel: BusinessCellViewModelProtocol?
}

// MARK: - Public API
extension BusinessCell {
    func configure(with newViewModel: BusinessCellViewModelProtocol) {
        viewModel = newViewModel
    }
}

// MARK: - Lifecycle
extension BusinessCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Helper Methods
extension BusinessCell {
    
}
