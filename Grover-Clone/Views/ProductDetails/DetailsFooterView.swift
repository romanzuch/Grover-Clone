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
                        HStack {
                            Text("\(String(format: "%.2f € ", prices[selectedDuration]-Float(discount)))").fontWeight(.bold).strikethrough()
                            Text("\(String(format: "%.2f € ", prices[selectedDuration]))").font(.title).fontWeight(.bold).foregroundColor(Color("GroverPink"))
                        }
                    } else {
                        Text("\(String(format: "%.2f € ", prices[$selectedDuration.wrappedValue]))").font(.title).fontWeight(.bold).foregroundColor(Color("GroverPink"))
                    }
                    switch selectedDuration {
                    case 0:
                        Text("pro Monat für 12 Monate, danach monatlich kündbar")
                            .font(.subheadline).fontWeight(.light)
                    case 1:
                        Text("pro Monat für 6 Monate, danach monatlich kündbar")
                            .font(.subheadline).fontWeight(.light)
                    case 2:
                        Text("pro Monat für 3 Monate, danach monatlich kündbar")
                            .font(.subheadline).fontWeight(.light)
                    case 3:
                        Text("pro Monat für 1 Monat, danach monatlich kündbar")
                            .font(.subheadline).fontWeight(.light)
                    default:
                        Text("pro Monat für 1 Monat, danach monatlich kündbar")
                            .font(.subheadline).fontWeight(.light)
                    }
                }
                Spacer()
                RentButton(productId: 1.0, selectedDuration: $selectedDuration.wrappedValue)
            }
            .padding()
        }
    }
}
