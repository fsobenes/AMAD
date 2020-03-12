//
//  QuizViewController.swift
//  Styled
//
//  Created by Fiorella Sobenes on 3/9/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    
    @IBOutlet weak var casualControl: UISegmentedControl!
    @IBOutlet weak var sororityControl: UISegmentedControl!
    @IBOutlet weak var punkControl: UISegmentedControl!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func quizComplete(_ sender: Any) {
        if casualControl.selectedSegmentIndex == 0{
           if sororityControl.selectedSegmentIndex == 0{
               if punkControl.selectedSegmentIndex == 0 {
                    let alert=UIAlertController(title: "Not Complete", message: "Do these really not fit your style? really? Please select one to say 'yes'", preferredStyle: UIAlertController.Style.alert)
                    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(cancelAction)
                    present(alert,animated: true,completion:nil)
                    punkControl.selectedSegmentIndex = 1
                    resultLabel.isHidden = false
                    resultLabel.text = "Your Style: Soft Punk Wannabe"
               }else if punkControl.selectedSegmentIndex == 1{
                    resultLabel.isHidden = false
                    resultLabel.text = "Your Style: Soft Punk Wannabe"
                }
           }else if punkControl.selectedSegmentIndex==1 && sororityControl.selectedSegmentIndex==1{
               let alert=UIAlertController(title: "Hold Up", message: "Are you having identity crisis? Please only choose one.", preferredStyle: UIAlertController.Style.alert)
               let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
               alert.addAction(cancelAction)
               present(alert,animated: true,completion:nil)
               punkControl.selectedSegmentIndex = 0
           casualControl.selectedSegmentIndex = 0
           }
           else if sororityControl.selectedSegmentIndex == 1{
                resultLabel.isHidden = false
                resultLabel.text = "Your Style: Rebel Sorority Wannabe"
            }
        }else if sororityControl.selectedSegmentIndex==1 && casualControl.selectedSegmentIndex==1{
            let alert=UIAlertController(title: "Hold Up", message: "Are you having identity crisis? Please only choose one.", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert,animated: true,completion:nil)
            punkControl.selectedSegmentIndex = 0
        casualControl.selectedSegmentIndex = 0
        }
        else if punkControl.selectedSegmentIndex==1 && casualControl.selectedSegmentIndex==1{
             let alert=UIAlertController(title: "Hold Up", message: "Are you having identity crisis? Please only choose one.", preferredStyle: UIAlertController.Style.alert)
             let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
             alert.addAction(cancelAction)
             present(alert,animated: true,completion:nil)
             punkControl.selectedSegmentIndex = 0
         casualControl.selectedSegmentIndex = 0
        } else if casualControl.selectedSegmentIndex == 1{
            resultLabel.isHidden = false
            resultLabel.text = "Your Style: As-if Casual Wannabe"
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
