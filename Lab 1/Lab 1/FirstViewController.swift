//
//  FirstViewController.swift
//  Lab 1
//
//  Created by Fiorella Sobenes on 2/4/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let animalComponent = 0
    let breedComponent = 1
    
    var animalBreed = AnimalBreedsController()
    var animals = [String]()
    var breeds = [String]()
    
    @IBOutlet weak var animalBreedPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try animalBreed.loadData()
            animals = try animalBreed.getAllAnimals()
            breeds = try animalBreed.getBreeds(idx: 0)
        } catch {
            print(error)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == animalComponent {
            return animals.count
        } else if component == breedComponent {
            return breeds.count
        } else {
            print("Unknown component")
            return -1
        }
    }

    //get the titles for each row from the data arrays
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == animalComponent {
            return animals[row]
        } else if component == breedComponent {
            return breeds[row]
        } else {
            print("Unkown component")
            return "Unknown component"
        }
    }

    //change the albums component when the user selects a new artist -- also update the choice label
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //need to update albums if user selects a new artists
        if component == animalComponent {
            //get the new list of albums
            do {
                animals = try animalBreed.getBreeds(idx: row)
            }
            catch {
                print(error)
            }
            //update the album component
            animalBreedPicker.reloadComponent(breedComponent)
            //reset the album component to the first row
            animalBreedPicker.selectRow(0, inComponent: breedComponent, animated: true)
        }
        
        let animal = pickerView.selectedRow(inComponent: animalComponent)
        let breed = pickerView.selectedRow(inComponent: breedComponent)
        
        choiceLabel.text = "You like \(animals[animal]) in their \(breeds[breed]) form"
    }
        

    }

