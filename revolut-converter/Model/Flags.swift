//
//  Flags.swift
//  revolut-converter
//
//  Created by Андрей Рожков on 19/12/2018.
//  Copyright © 2018 Andrey Rozhkov. All rights reserved.
//

import Foundation

class Flag {
    private let flags = [
                 "USD":"🇺🇸",
                 "AUD":"🇦🇺",
                 "EUR":"🇪🇺",
                 "BGN":"🇧🇬",
                 "BRL":"🇧🇷",
                 "CAD":"🇨🇦",
                 "CHF":"🇨🇭",
                 "CNY":"🇨🇳",
                 "CZK":"🇨🇿",
                 "DKK":"🇩🇰",
                 "GBP":"🇬🇧",
                 "HKD":"🇭🇰",
                 "HRK":"🇭🇷",
                 "HUF":"🇭🇺",
                 "IDR":"🇲🇨",
                 "ILS":"🇮🇱",
                 "INR":"🇮🇳",
                 "ISK":"🇮🇸",
                 "JPY":"🇯🇵",
                 "KRW":"🇰🇷",
                 "MXN":"🇲🇽",
                 "MYR":"🇲🇾",
                 "NOK":"🇳🇴",
                 "NZD":"🇳🇿",
                 "PHP":"🇵🇭",
                 "PLN":"🇵🇱",
                 "RON":"🇷🇴",
                 "RUB":"🇷🇺",
                 "SEK":"🇸🇪",
                 "SGD":"🇸🇬",
                 "THB":"🇹🇭",
                 "TRY":"🇹🇷",
                 "ZAR":"🇿🇦"]
    
    func getFlag(base: String) -> String {
        return self.flags[base] ?? ""
    }
}
    





