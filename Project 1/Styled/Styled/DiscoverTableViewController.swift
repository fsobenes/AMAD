//
//  DiscoverTableViewController.swift
//  Styled
//
//  Created by Fiorella Sobenes on 3/9/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class DiscoverTableViewController: UITableViewController {

    var brandsinDiscover = ["Adidas","American Eagle","Burberry","Gucci","Hollister","Nike","Pacsun","Puma","Topshop","Urban Outfitters","Zara"]
    
    var links = ["http://www.adidas.com/","https://www.ae.com/us/en","http://www.burberry.com/","http://www.gucci.com/","http://www.hollisterco.com/","http://www.nike.com/","http://www.pacsun.com/","http://www.puma.com/","http://www.topshop.com/","http://www.urbanoutfitters.com/","http://www.zara.com/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 65

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    func schemeAvaileble(scheme:String) -> Bool{
      //make url form scheme
        if let url = URL(string: scheme){
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    
    func openApp(scheme: String){
        //open the app
        if let url = URL(string: scheme){
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in  print("successfully opened \(scheme)")})// persist user location in app & save data
        }
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return brandsinDiscover.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = brandsinDiscover[indexPath.row]
        
        return cell
    }
     

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLinks" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destination = segue.destination as? LinksViewController
                destination?.links = links[indexPath.row]
            }
        }
    }
    

}
