//
//  Copyright © 2018 Weedmaps, LLC. All rights reserved.
//

import UIKit
import WebKit

class HomeDetailViewController: UIViewController {
    @IBOutlet private var webView: WKWebView!
    
    private var websiteURLRequest: URLRequest?
}

extension HomeDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
}

extension HomeDetailViewController {
    func configure(with url: URL) {
        websiteURLRequest = URLRequest(url: url)
    }
}

private extension HomeDetailViewController {
    func load() {
        guard let request = websiteURLRequest else {
            return
        }
        
        webView.load(request)
    }
}
