//
//  VKLogInVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 16.12.2020.
//

import UIKit
import WebKit
import Alamofire

class VKLogInVC: UIViewController {



    @IBOutlet weak var webview: WKWebView!
    {
            didSet{
                webview.navigationDelegate = self
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7700698"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value:
        "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.126")
                ]
                let request = URLRequest(url: urlComponents.url!)
                webview.load(request)
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        dismiss(animated: true, completion: nil)
//    }
}

extension VKLogInVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse:
WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy)
-> Void) {
        guard let url = navigationResponse.response.url, url.path ==
"/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
return
}
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
        Session.instance.token = params["access_token"]
        Session.instance.userId = Int(params["user_id"]!)
        
        decisionHandler(.cancel)
        
        let friends = ApiGetFriendsVK()
        friends.getData(fields: "bdate")

        let groups = ApiGetGroupsVK()
        groups.getData(fields: "city,members_count,start_date")

        let photos = ApiGetPhotosVK()
        photos.getData()

        let search = ApiGetGroupsVKSearch()
        search.getData(searchText: "ios")
        
        self.performSegue(withIdentifier: "Start", sender: self)
    }
}
