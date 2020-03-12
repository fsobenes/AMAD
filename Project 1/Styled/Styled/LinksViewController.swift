//
//  LinksViewController.swift
//  Styled
//
//  Created by Fiorella Sobenes on 3/12/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit
import WebKit

//https://daddycoding.com/2017/10/17/ios-tutorials-triggering-tableviewcell-visit-site/

class LinksViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var links: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL (string: links)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
