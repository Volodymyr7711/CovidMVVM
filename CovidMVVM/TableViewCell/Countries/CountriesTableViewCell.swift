//
//  CountriesTableViewCell.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImg: UIImageView!
    @IBOutlet weak var countryTitle: UILabel!
    @IBOutlet weak var countryCases: UILabel!
    @IBOutlet weak var countryDeath: UILabel!
    
    var countries: Countries? {
        didSet {
            countryTitle.text = countries?.country
            countryCases.text = String((countries?.cases)!)
            countryDeath.text = String((countries?.deaths)!)
        }
    }
}
