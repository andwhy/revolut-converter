//
//  String + Ext.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 16/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

extension String {
    func isNumberOrDot() -> Bool {
        print(self)
        let range = self.range(of: "^[0-9.]{0,1}$", options: .regularExpression, range: nil, locale: nil)
        return range != nil
    }
}
