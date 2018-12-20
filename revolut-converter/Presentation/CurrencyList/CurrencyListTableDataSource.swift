//
//  CurrencyListTableDataSource.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 06/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import UIKit

class CurrencyListTableDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var currency: Currency?

    
    //MARK: TableDataSourse
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency != nil ? currency!.rates.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CurrencyCell.self), for: indexPath) as! CurrencyCell
        
        cell.updateWith(currency: currency!, andIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedCell = tableView.cellForRow(at: indexPath) as? CurrencyCell
        selectedCell?.setFirstResponder()
        
        let firstIndexPath = IndexPath(row: 0, section: 0)
        let firstCell = tableView.cellForRow(at: firstIndexPath) as? CurrencyCell
        firstCell?.endEditing()
        
        tableView.performBatchUpdates({
            tableView.moveRow(at: indexPath, to: firstIndexPath)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                tableView.scrollToRow(at: firstIndexPath, at: .top, animated: false)
            }, completion: { [unowned self] _ in
                self.currency?.moveRateToFirstIndex(from: indexPath.row)
            })
        })
    }

    
}

