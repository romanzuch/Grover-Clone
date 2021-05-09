//
//  Products.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import Foundation

class Products: ObservableObject {
    @Published var imageNames: [String] = ["apple_ipad_air_wifi",
                                "apple_watch_6",
                                "bose_sport_earburds",
                                "microsoft_surface_go"
    ]
    @Published var productTitles: [String] = ["Apple iPad Air WiFi 256GB (2020)",
                                   "Apple Watch Serie 6 GPS, 40-mm-Aluminiumgehäuse, Sportarmband",
                                   "Bose Sport Earbuds",
                                   "Apple MacBook Air (Late 2020) Notebook - Apple M1 - 8GB - 256GB SSD - Apple Integrated 7-core GPU"
    ]
    @Published var productSubTitle: [String] = ["10.9 Zoll Retina Display, 12MP Rückkamera, Touch ID, Magic Tastatur Unterstützung",
                                     "Aluminiumgehäuse und Sportband, bis zu 18 h Akku",
                                     "Bluetooth 5.0, Rauschisolierung, Bis zu 5+10h",
                                     "13.3 Zoll, Tastatursprache - Deutsch"
    ]
    @Published var productOldPrices: [String] = ["39.90", "19.90", "9.90", "54.90"]
    @Published var productPrices: [String] = ["29.90", "19.90", "9.90", "49.90"]

    @Published var deals: [Bool] = [true, false, false, true]
}
