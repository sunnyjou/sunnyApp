//
//  MyBrowserViewController.swift
//  class03
//
//  Created by L20102-02 on 2019/5/6.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit
import WebKit

class MyBrowserViewController: UIViewController, UITextFieldDelegate, AsyncReponseDelegate {
    
    
    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        
        //print(responseString)
        //myWebView.loadHTMLString(responseString, baseURL: URL(string: "https://www.google.com")!)
        
    }
    
    
    
    @IBOutlet weak var btnGoBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let Worker: AsyncRequestWorker = AsyncRequestWorker()
        
        Worker.reponseDelegate = self
        Worker.getResponse(from: "https://www.google.com", tag: 1)
        
        //myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        
    }
    
    
    
    
    
    
    
    
    // MARK: -notification center
    @objc func dataReceived(notification : NSNotification?) {
        
        
        guard let responseString = notification? .userInfo?["aaa"] as? String else {
            return
        }
        
        
        print(responseString)
        myWebView.loadHTMLString(responseString, baseURL: URL(string: "https://www.google.com")!)
        
    }
    
    
    
    
    

}
