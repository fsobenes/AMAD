//
//  AnimalBreedsController.swift
//  Lab 1
//
//  Created by Fiorella Sobenes on 2/5/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import Foundation

enum DataError: Error {
case BadFilePath
case CouldNotDecodeData
case NoData
}

class AnimalBreedsController {
    var animalBreedData: [AnimalBreeds]?
    let filename = "AnimalsList"
    
    func loadData() throws {
        print("Loading data....")
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist") {
            let decoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                animalBreedData = try decoder.decode([AnimalBreeds].self, from: data)
                print("Data loaded")
            } catch {
                throw DataError.CouldNotDecodeData
            }
        }
        else {
            throw DataError.BadFilePath
        }
    }
    
    func getAllAnimals() throws -> [String] {
        var animals = [String]()
        if let data = animalBreedData {
            for animal in data {
                animals.append(animal.animal)
            }
            return animals
        }
        else {
            //we don't have data!
            throw DataError.NoData
        }
        
        
    }

    //get the albums for any of the artists or throw an error
    func getBreeds(idx: Int) throws -> [String] {
        if let data = animalBreedData {
            return data[idx].breed
        }
        else {
            //we don't have data!
            throw DataError.NoData
        }
    }
}
