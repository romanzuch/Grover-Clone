//
//  HomeView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct HomeView: View {
    
    var geometry: GeometryProxy
    var imageNames: [String] = ["apple_ipad_air_wifi",
                                "apple_watch_6",
                                "bose_sport_earburds",
                                "microsoft_surface_go"
    ]
    var productTitles: [String] = ["Apple iPad Air WiFi 256GB (2020)",
                                   "Apple Watch Serie 6 GPS, 40-mm-Aluminiumgehäuse, Sportarmband",
                                   "Bose Sport Earbuds",
                                   "Apple MacBook Air (Late 2020) Notebook - Apple M1 - 8GB - 256GB SSD - Apple Integrated 7-core GPU"
    ]
    var productSubTitle: [String] = ["10.9 Zoll Retina Display, 12MP Rückkamera, Touch ID, Magic Tastatur Unterstützung",
                                     "Aluminiumgehäuse und Sportband, bis zu 18 h Akku",
                                     "Bluetooth 5.0, Rauschisolierung, Bis zu 5+10h",
                                     "13.3 Zoll, Tastatursprache - Deutsch"
    ]
    var productOldPrices: [String] = ["39.90", "19.90", "9.90", "54.90"]
    var productPrices: [String] = ["29.90", "19.90", "9.90", "49.90"]
    
    var deals: [Bool] = [true, true, false, true]
    
    init(geometry: GeometryProxy) {
        self.geometry = geometry
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            HomeAdView(geometry: geometry)
                .padding(.horizontal, 12)
                .padding(.top, 24)
            ForEach(Array(productTitles.enumerated()), id: \.offset) { offset, item in
                ItemPillView(geometry: geometry,
                             title: item,
                             subtitle: productSubTitle[offset],
                             deal: deals[offset],
                             price: productPrices[offset],
                             oldPrice: productOldPrices[offset],
                             image: Image(imageNames[offset]))
                    .padding(.vertical, 6)
            }
            .padding(.horizontal, 12)
        }
        
    }
}
