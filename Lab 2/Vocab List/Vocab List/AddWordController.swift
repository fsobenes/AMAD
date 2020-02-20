//
//  AddWordController.swift
//  Vocab List
//
//  Created by Fiorella Sobenes on 2/19/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class AddWordController: UIViewController {

    var addedWord = String()
    
    @IBOutlet weak var wordField: UITextField!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save"{
            if wordField.text?.isEmpty == false{
                addedWord = wordField.text!
            }
        }
    }

}
