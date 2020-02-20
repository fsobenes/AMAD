//
//  ViewController.swift
//  Vocab List
//
//  Created by Fiorella Sobenes on 2/19/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    

    var speechData = WordsDataController()
    var selectedspeech = 0
    var wordList = [String]()
        
    

    override func viewWillAppear(_ animated: Bool) {
        wordList = speechData.getwords(idx: selectedspeech)
        print(wordList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        if segue.identifier == "save"{
            let source = segue.source as! AddWordController
            
            if source.addedWord.isEmpty == false {
                
                speechData.addWord(dataIdx: selectedspeech, newWord: source.addedWord, wordIdx: wordList.count)
                wordList.append(source.addedWord)
                tableView.reloadData()
                
            }
        }
        
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordList.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = wordList[indexPath.row]
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            wordList.remove(at: indexPath.row)
            speechData.deleteWord(dataIdx: selectedspeech, wordIdx: indexPath.row)
            //Update table
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
        }    
    }
    

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


//class VocabListClass {
//    var word = ""
//    var partofspeech = ""
//
//    convenience init (word: String, partofspeech: String){
//        self.init()
//        self.word = word
//        self.partofspeech = partofspeech
//    }
//}
