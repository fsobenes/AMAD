//
//  AnimalBreeds.swift
//  Lab 1
//
//  Created by Fiorella Sobenes on 2/5/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import Foundation

struct AnimalBreeds: Decodable {
    let animal: String
    let breed: [String]
}
