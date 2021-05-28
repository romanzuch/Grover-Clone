//
//  ProductDetailView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct ProductDetailView: View {
    
    var geometry: GeometryProxy
    var title: String
    var description: String
    var deal: Bool
    var prices: [Float]
    var discount: Int
    var images: [String]
    var category: String
    var product: Product
    
    @State private var selectedDuration: Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    init(geometry: GeometryProxy, product: Product, presentDetails: Binding<Bool>) {
        self.product = product
        self.geometry = geometry
        self.title = product.name
        self.description = product.description
        self.deal = product.deal
        self.prices = product.prices
        self.discount = product.discount
        self.images = product.images
        self.category = product.category
        
    }
    
    var body: some View {
        VStack {
            ProductDetailsHeader(geometry: geometry, category: category, presentationMode: presentationMode)
                .padding(.horizontal, 12)
            
            ScrollView {
                TabView {
                    ForEach(0..<images.count) { index in
                        AsyncImage(url: URL(string: images[index])!, placeholder: { ImageLoaderPlaceholder() })
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: geometry.size.height * 0.2)
                            .padding()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height / 3)
                
                ProductDetailsPillView(geometry: geometry, product: product, selectedDurationPassed: $selectedDuration)
                    .padding(.horizontal, 12)
            }
            
            Spacer()
            
            DetailsFooterView(geometry: geometry, product: product, selectedDuration: $selectedDuration)
                .frame(width: geometry.size.width, height: geometry.size.height/10)
        }
    }
}
