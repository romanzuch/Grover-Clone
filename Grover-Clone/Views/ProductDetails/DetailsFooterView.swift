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
    var price: Float
    var oldPrice: Float
    var priceText: Text
    
    init(geometry: GeometryProxy,
         deal: Bool,
         price: Float,
         discount: Int) {
        self.geometry = geometry
        self.deal = deal
        self.price = price
        self.oldPrice = price + Float(discount)
        
        if deal {
            self.priceText = Text("\(String(format: "%.2f € ", oldPrice))").font(.title3).fontWeight(.bold).strikethrough() + Text("\(String(format: "%.2f € ", price))").font(.title).fontWeight(.bold).foregroundColor(Color("GroverPink"))
        } else {
            self.priceText = Text("\(String(format: "%.2f € ", price))").font(.title).fontWeight(.bold).foregroundColor(Color("GroverPink"))
        }
        
    }
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.bottom)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
            
            HStack {
                VStack(alignment: .leading) {
                    priceText
                    Text("pro Monat für 12 Monate, danach monatlich kündbar")
                        .font(.subheadline).fontWeight(.light)
                }
                Spacer()
                RentButton(productId: price)
            }
            .padding()
        }
    }
}
