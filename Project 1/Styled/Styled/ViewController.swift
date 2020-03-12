//
//  ViewController.swift
//  Styled
//
//  Created by Fiorella Sobenes on 3/5/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        if segue.identifier == "Save"{
            let source = segue.source as! QuizViewController
        }
    }


}

