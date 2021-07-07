//
//  LoginViewController.swift
//  VKClient
//
//  Created by Aleksandr Serov on 24/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!{
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7146533"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        
    }
    
}

// Тут особо не понятно

extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
            let fragment = url.fragment else {
                decisionHandler(.allow)
                return }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        let id = params["user_id"]
        
        // Лучше переделать через проверку, получени ли токен или нет!
        
        Session.shared.token = (token ?? "token is empty")!
        Session.shared.id = (id ?? "id did not found")!
        
        print("Token: \(Session.shared.token)")
        print("Id: \(Session.shared.id)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.present(viewController, animated: true, completion: nil)
        
        decisionHandler(.cancel)
    }
    
}

