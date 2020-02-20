//
//  WordDataController.swift
//  Vocab List
//
//  Created by Fiorella Sobenes on 2/20/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import Foundation
import UIKit

struct WordDataModel: Codable {
    var speech: String
    var word: [String]
}

enum DataError: Error {
    case NoDataFile
    case CouldNotDecode
    case CouldNotEncode
}

class WordsDataController {
    var allData = [WordDataModel]()
    let fileName = "Words"
    let dataFileName = "data.plist"

    func loadData() throws {
        let pathURL: URL?
        
        let dataFileURL = getDataFile(datafile: dataFileName)
        
        if FileManager.default.fileExists(atPath: dataFileURL.path) {
            pathURL = dataFileURL
        } else {
            pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist")
        }

        if let dataURL = pathURL {
            let decoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: dataURL)
                allData = try decoder.decode([WordDataModel].self, from: data)
            } catch {
                throw DataError.CouldNotDecode
            }
        }
        else {
            throw DataError.NoDataFile
        }
    }
    
    func getDataFile(datafile: String) -> URL {
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0]
        
        return docDir.appendingPathComponent(datafile)
    }
    
    func getSpeech() -> [String] {
        var allSpeech = [String]()
        for item in allData {
            allSpeech.append(item.speech)
        }
        return allSpeech
    }
    
    
    func getwords(idx: Int) -> [String] {
        return allData[idx].word
    }
    
    func addWord(dataIdx: Int, newWord: String, wordIdx: Int) {
        allData[dataIdx].word.insert(newWord, at: wordIdx)
        
    }

    func deleteWord(dataIdx: Int, wordIdx: Int) {
        allData[dataIdx].word.remove(at: wordIdx)
    }
}
