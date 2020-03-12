//
//  AddBrandViewController.swift
//  Styled
//
//  Created by Fiorella Sobenes on 3/12/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class AddBrandViewController: UIViewController {

    var addedBrand: String = ""
    
    @IBOutlet weak var brandField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save"{
            //let pVC = segue.destination as! BrandsTableViewController
            if brandField.text?.isEmpty == false{
               addedBrand = brandField.text!
           }
       }
    }
    

}
