//
//  ShowViewController.swift
//  Multimedia-HomeWork-IOS-8 Kharin_ALEXEY
//
//  Created by Alexey Kharin on 10.05.2021.
//

import UIKit
import WebKit
class ShowViewController: UIViewController {
    
    var urlString: URL?
  
    static func storyboardInstance(url: URL) -> ShowViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: String(describing: ShowViewController.self)) as? ShowViewController
        vc?.urlString = url
        return vc
    }
    
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlSafety = urlString else { return print("Net dannuh")}
        let request = URLRequest(url: urlSafety)
            webView.load(request)
        // Do any additional setup after loading the view.
    }
}
