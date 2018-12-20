//
//  RatesTextFieldDelegate.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 16/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import UIKit



class RatesTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    public var editable: Bool?
    var currency: Currency?

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return editable ?? false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        if string.isNumberOrDot() {
            guard var text = textField.text, let range = Range(range, in: text) else { return true }

            if text == "0" {
                text = string
            } else {
                text.replaceSubrange(range, with: string)
            }

            if text.isEmpty {
                text = "0"
            }
            
            if let value = Double(text) {
                currency!.baseValue = value
                textField.text = text
            }
            return false
        } else {
            return false
        }
    }
}
