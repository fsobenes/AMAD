//
//  SpeechViewController.swift
//  Vocab List
//
//  Created by Fiorella Sobenes on 2/20/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class SpeechViewController: UITableViewController {

    var speechList = [String]()
    var speechDataController = WordsDataController()
    
    var searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        do {
            try speechDataController.loadData()
            speechList = speechDataController.getSpeech()
            
            let resultsController = SearchResultsController()
            resultsController.allWords = speechList
            searchController = UISearchController(searchResultsController: resultsController)
            searchController.searchBar.placeholder = "Find Word"
            searchController.searchBar.sizeToFit()
            tableView.tableHeaderView = searchController.searchBar
            searchController.searchResultsUpdater = resultsController
        } catch {
            print(error)
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speechList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "speechCell", for: indexPath)
        cell.textLabel?.text = speechList[indexPath.row]

        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vocabSegue" {
            let detailVC = segue.destination as! ViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            if let selection = indexPath?.row {
                detailVC.selectedspeech = selection
                detailVC.title = speechList[selection]
                detailVC.speechData = speechDataController
            }
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
