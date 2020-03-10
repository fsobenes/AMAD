//
//  Holiday.swift
//  Holidays
//
//  Created by Fiorella Sobenes on 3/10/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import Foundation

struct HolidayResponse:Decodable {
    var response: Holidays
}

struct Holidays:Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail: Decodable {
    var name: String
    var date: DateInfo
}

struct DateInfo:Decodable {
    var iso: String
}
