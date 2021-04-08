//
//  CountriesViewController.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//

import UIKit
import RxSwift
import RxCocoa

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var countriesViewModel: CountriesViewModel!
    private let disposeBag = DisposeBag()
    
    private var dataSource: CountriesTableViewDataSource<CountriesTableViewCell, Countries>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callData()
    }
    func callData() {
        self.countriesViewModel = CountriesViewModel()
        self.countriesViewModel.bindCountriesViewModelToController = { [ weak self] in
            self?.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = CountriesTableViewDataSource(cellIdentifier: "CountryCell", items: self.countriesViewModel.countriesData,  configureCell: { (cell, evm) in
            let Img = evm.countryInfo.flag
            cell.countryImg.layer.cornerRadius = 6
            cell.countryImg.layer.borderWidth = 1
            cell.countryImg.layer.borderColor = UIColor.lightGray.cgColor
            cell.countryImg.sd_setImage(with: URL(string: Img), completed: nil)
            cell.countryTitle.text = evm.country
            cell.countryCases.text = String(evm.cases)
            cell.countryDeath.text = String(evm.deaths!)
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}
