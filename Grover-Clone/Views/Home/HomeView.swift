//
//  HomeView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct HomeView: View {
    
    var geometry: GeometryProxy
    var products = Products()
    
    init(geometry: GeometryProxy) {
        self.geometry = geometry
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            HomeAdView(geometry: geometry)
                .padding(.horizontal, 12)
                .padding(.top, 24)
            ForEach(Array(products.productTitles.enumerated()), id: \.offset) { offset, item in
                ItemPillView(geometry: geometry,
                             title: item,
                             subtitle: products.productSubTitle[offset],
                             deal: products.deals[offset],
                             price: products.productPrices[offset],
                             oldPrice: products.productOldPrices[offset],
                             image: Image(products.imageNames[offset])
                )
                .padding(.vertical, 6)
            }
            .padding(.horizontal, 12)
        }
        
    }
}
