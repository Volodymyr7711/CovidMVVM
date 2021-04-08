//
//  CountriesViewModel.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//


import UIKit

class CountriesViewModel: NSObject {
    private var apiService : APIService!
    private(set) var countriesData : [Countries]! {
        didSet {
            self.bindCountriesViewModelToController()
        }
    }
    
    var bindCountriesViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetCountriesData { (countriesData) in
            self.countriesData = countriesData
        }
    }
}
