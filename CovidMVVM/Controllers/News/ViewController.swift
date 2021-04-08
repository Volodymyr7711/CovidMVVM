//
//  ViewController.swift
//  CovidMVVM
//
//  Created by Volodymyr Mendyk on 07.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var newsViewModel : NewsViewModel!
    
    private var dataSource : NewsTableViewDataSource<NewsTableViewCell,Article>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callData()
    }
    
    func callData() {
        self.newsViewModel = NewsViewModel()
        self.newsViewModel.bindNewsViewModelToController = { [ weak self] in
            self?.updateDataSource()
        }
    }
    func updateDataSource(){
        
        self.dataSource = NewsTableViewDataSource(cellIdentifier: "Cell", items: self.newsViewModel.empData.articles, configureCell: { (cell, evm) in
            let Img = evm.urlToImage
            cell.img.sd_setImage(with: URL(string: Img!), completed: nil)
            cell.titleLabel.text = evm.title
            cell.descLabel.text = evm.description
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}

