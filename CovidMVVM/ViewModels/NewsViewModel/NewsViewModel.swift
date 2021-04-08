//
//  NewsViewModel.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsViewModel: NSObject {
    private var apiService : APIService!
    private(set) var empData: NewsFeed!{
        didSet {
            self.bindNewsViewModelToController()
        }
    }
    
    var bindNewsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetNewsData { (empData) in
            self.empData = empData
        }
    }
}
