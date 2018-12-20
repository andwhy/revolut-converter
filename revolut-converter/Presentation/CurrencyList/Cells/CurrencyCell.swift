//
//  CurrencyCell.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 06/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell, CellRegisterable {

    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var valueTextField: UITextField!
    private var valueTextFieldDelegate = RatesTextFieldDelegate()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.valueTextField.delegate = valueTextFieldDelegate
    }
    
    func updateWith(currency: Currency, andIndexPath indexPath:IndexPath) {
        valueTextFieldDelegate.currency = currency
        let rate = currency.rates[indexPath.row]
        setValueTextFieldDelegateMode(editable: currency.isBase(rate.base))
        codeLabel.text = rate.base
        DispatchQueue.main.async {
            self.valueTextField.text = String.init(format: "%g", currency.calculateRateValue(base: rate.base))
        }
        if indexPath.row == 0 {
            self.setFirstResponder()
        } else {
            self.endEditing()
        }
        iconLabel.text = rate.getFlag()

    }
    
    public func setFirstResponder()  {
        valueTextField.isUserInteractionEnabled = true
        setValueTextFieldDelegateMode(editable: true)
        valueTextField.becomeFirstResponder()
    }
    
    public func endEditing() {
        valueTextField.isUserInteractionEnabled = false
        setValueTextFieldDelegateMode(editable: false)
        valueTextField.resignFirstResponder()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        endEditing()
    }
    
    private func setValueTextFieldDelegateMode(editable: Bool) {
        valueTextFieldDelegate.editable = editable
    }
    
    
}
