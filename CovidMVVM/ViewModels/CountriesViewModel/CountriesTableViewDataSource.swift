//
//  CountriesTableViewDataSource.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//

import Foundation
import UIKit

class CountriesTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource, UITableViewDelegate  {
    
    typealias ZECellRenderBlock = (_ indexPath:IndexPath,_ tableView:UITableView) -> UITableViewCell?
    typealias ZECellSelectBlock = (_ indexPath:IndexPath,_ tablleView:UITableView) -> Void
    var cellSelected : ZECellSelectBlock?
    private var cellIdentifier : String!
    private var countryItems : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.countryItems =  items
        self.configureCell = configureCell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let countryItems = self.countryItems[indexPath.row]
        self.configureCell(cell, countryItems)
        return cell
    }
  
    
    
}

