//
//  Countries.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//

import Foundation


struct Base: Codable {
    var covid: [Countries]
}

struct Countries: Codable {
    var country: String
    var cases: Int
    var deaths: Int?
    var todayDeaths: Int?
    var recovered: Int!
    var continent: String
    var todayRecovered: Int?
    var countryInfo: CountryInfo
}

struct CountryInfo: Codable {
    var flag: String
}
