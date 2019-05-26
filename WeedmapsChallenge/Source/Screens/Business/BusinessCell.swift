//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit
import Kingfisher

class BusinessCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var viewModel: BusinessCellViewModelProtocol?
}

// MARK: - Public API
extension BusinessCell {
    func configure(with newViewModel: BusinessCellViewModelProtocol) {
        viewModel = newViewModel
        
        descriptionLabel.text = viewModel?.detail
        descriptionLabel.preferredMaxLayoutWidth = frame.width - 8.0
        
        guard let imageURLString = viewModel?.imageURLString else {
            return
        }
        
        imageView.kf.setImage(with: URL(string: imageURLString))
    }
}

// MARK: - Lifecycle
extension BusinessCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }
}

// MARK: - Helper Methods
private extension BusinessCell {
    func reset() {
        layer.cornerRadius = 3
        clipsToBounds = true
        
        imageView.image = #imageLiteral(resourceName: "placeholder")
        descriptionLabel.text = "err"
    }
}

extension BusinessCell {
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
}
