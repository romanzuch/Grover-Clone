//
//  DetailsFooterView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct DetailsFooterView: View {
    
    var geometry: GeometryProxy
    var deal: Bool
    var prices: [Float]
    var discount: Float
    var productId: String
    
    @Binding var selectedDuration: Int
    
    init(geometry: GeometryProxy, product: Product, selectedDuration: Binding<Int>) {
        self.geometry = geometry
        self.deal = product.deal
        self.prices = product.prices
        self.discount = Float(product.discount)
        self.productId = product.id!
        self._selectedDuration = selectedDuration
        
    }
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.bottom)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
            
            HStack {
                VStack(alignment: .leading) {
                    if deal {
//                        PriceTextView(prices: prices, discount: discount, selectedDuration: $selectedDuration)
                        Text("selected: \(prices[selectedDuration])")
                    } else {
                        Text("\(String(format: "%.2f € ", prices[$selectedDuration.wrappedValue]))").font(.title).fontWeight(.bold).foregroundColor(Color("GroverPink"))
                    }
                    Text("pro Monat für 12 Monate, danach monatlich kündbar")
                        .font(.subheadline).fontWeight(.light)
                }
                Spacer()
                RentButton(productId: 1.0, selectedDuration: $selectedDuration.wrappedValue)
            }
            .padding()
        }
    }
}
