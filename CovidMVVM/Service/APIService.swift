//
//  APIService.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//

import Foundation

class APIService: NSObject {
    
    private let sourcesURL = URL(string: "http://newsapi.org/v2/everything?q=covid&language=en&apiKey=c4a5aefd474b42069c588527578ffa4a")!
    
    func apiToGetNewsData(completion : @escaping (NewsFeed) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(NewsFeed.self, from: data)
                
                completion(empData)
            }
            
        }.resume()
    }
    private var model = [Countries]()
    
    private let sourceURLCountries = URL(string: "https://disease.sh/v3/covid-19/countries")!
    
    func apiToGetCountriesData(completion: @escaping ([Countries]) -> ()) {
        URLSession.shared.dataTask(with: sourceURLCountries) { (data, urlResponse, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let countryData = try! jsonDecoder.decode([Countries].self, from: data)
                
                completion(countryData)
            }
            
        }.resume()
    }
}
