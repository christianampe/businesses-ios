//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit
import WebKit

class HomeDetailViewController: UIViewController {
    @IBOutlet private var webView: WKWebView!
    
    private var viewModel: HomeDetailViewModelProtocol?
}

extension HomeDetailViewController {
    func configure(with newViewModel: HomeDetailViewModelProtocol) {
        viewModel = newViewModel
    }
}
