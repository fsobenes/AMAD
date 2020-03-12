//
//  BrandsTableViewController.swift
//  Styled
//
//  Created by Fiorella Sobenes on 3/9/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class BrandsTableViewController: UITableViewController {

    var brandsInList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 65


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if segue.identifier == "save"{
            let sourcee = segue.source as! AddBrandViewController
            if sourcee.addedBrand.isEmpty == false{
                brandsInList.append(sourcee.addedBrand)
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return brandsInList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath)
        
        
        cell.textLabel?.text = brandsInList[indexPath.row]

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            brandsInList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
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
