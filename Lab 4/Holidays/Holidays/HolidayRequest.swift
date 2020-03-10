//
//  HolidayRequest.swift
//  Holidays
//
//  Created by Fiorella Sobenes on 3/10/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//
//api https://calendarific.com/api/v2/holidays?&api_key=e44b7a198850487e08f36ef914ec659c285b8bfb&country=US&year=2019

import Foundation

enum HolidayError: Error{
    case noDataAvailable
    case canNotProcessData
}


struct HolidayRequest {
    let resourceURL:URL
    let API_KEY = "e44b7a198850487e08f36ef914ec659c285b8bfb"
    
    init(countryCode:String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getHolidays(completion: @escaping(Result<[HolidayDetail], HolidayError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidaysResponse.response.holidays
                
                completion(.success(holidayDetails))
            }catch{
                completion(.failure(.canNotProcessData))
            }
            
        }
        dataTask.resume()
    }
}
