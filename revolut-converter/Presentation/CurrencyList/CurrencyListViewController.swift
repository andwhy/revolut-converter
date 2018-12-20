//
//  CurrencyListViewController.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 06/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import UIKit

class CurrencyListViewController: UIViewController {
    
    var currencyOperation: CurrencyOperation? = CurrencyOperation()
    let tableDataSource = CurrencyListTableDataSource()
    var currency: Currency? {
        didSet {
            tableDataSource.currency = self.currency
            DispatchQueue.main.async { self.tableView.reloadData() }

            currency?.updated = { [unowned self] in
                DispatchQueue.main.async {
                    
                    guard var visibleRows = self.tableView.indexPathsForVisibleRows else { return }
                    if let firstRowIndex = visibleRows.firstIndex(where: { $0.row == 0 }) {
                        visibleRows.remove(at: firstRowIndex)
                    }
                    self.tableView.reloadRows(at: visibleRows, with: .none)
                }
            }
        }
    }
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            CurrencyCell.register(in: tableView)

            tableView.dataSource = tableDataSource
            tableView.delegate = tableDataSource            
            tableView.keyboardDismissMode = .onDrag
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let environment = DefaultEnvironment()
        let dispatcher = NetworkDispatcher(environment: environment)
        
        self.currencyOperation!.executeRepeatedly(in: dispatcher, completition: { [unowned self] (currency, status) in

            switch status {
            case .success:
                self.currency = currency
            case .error:
                print("error")
            case .updated:
                break
            }
        })
        
        
    }

}
