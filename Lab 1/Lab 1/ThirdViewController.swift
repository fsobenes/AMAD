//
//  ThirdViewController.swift
//  Lab 1
//
//  Created by Fiorella Sobenes on 2/5/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let calendarScheme = "calendar://"
    let animalScheme = "https://cuteanimals.tumblr.com/"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func openApp(scheme: String) {
      if let url = URL(string: scheme) {
        UIApplication.shared.open(url, options: [:], completionHandler: {
          (success) in
          print("Open \(scheme): \(success)")
        })
      }
    }
    
    func schemeAvailable(scheme: String) -> Bool {
        if let url = URL(string: scheme) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    @IBAction func takeMeThere(_ sender: Any) {
        let calendarInstalled = schemeAvailable(scheme: calendarScheme)
        
        
        if calendarInstalled {
            openApp(scheme: calendarScheme)
        } else {
            openApp(scheme: animalScheme)
        }
        
    }
    
}
