//
//  Cell + Ext.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 06/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import UIKit

protocol CellRegisterable { }

extension CellRegisterable {
    static func register(in table: UITableView) {
        table.register(UINib.init(nibName: String(describing: self), bundle: nil), forCellReuseIdentifier: String(describing: self))
    }
}
