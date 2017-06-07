//
//  WebViewController.swift
//  kDisp BBS
//
//  Created by KyleCheng on 2017/5/25.
//  Copyright © 2017年 KyleCheng. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var myWebview: UIWebView!
    var urlString : String!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if let tarUrl = URL(string: self.urlString)
        {
            self.myWebview.delegate = self
            let request = URLRequest(url: tarUrl)
            self.myWebview.loadRequest(request)
        }
        
    
    }


    // MARK: - Webview Delegate

  func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        
        return true
    }

    func webViewDidStartLoad(_ webView: UIWebView)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
