//
//  HomeView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct HomeView: View {
    
    var geometry: GeometryProxy
    var products: [Product]
    
    init(geometry: GeometryProxy, products: [Product]) {
        self.geometry = geometry
        self.products = products
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HomeAdView(geometry: geometry)
                    .padding(.horizontal, 12)
                    .padding(.top, 24)
                ForEach(products, id: \.self) { product in
                    ItemPillView(geometry: geometry, product: product)
                    .padding(.vertical, 6)
                        .onAppear {
                            print(product.id)
                        }
                }
                .padding(.horizontal, 12)
            }
            .frame(width: geometry.size.width)
        }
        
    }
}
