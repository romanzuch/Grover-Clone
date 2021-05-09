//
//  ItemPillView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct ItemPillView: View {
    
    var geometry: GeometryProxy
    var title: String
    var subtitle: String
    var deal: Bool
    var price: String
    var oldPrice: String
    var image: Image
    var priceText: Text
    
    init(geometry: GeometryProxy, title: String, subtitle: String, deal: Bool, price: String, oldPrice: String, image: Image) {
        self.geometry = geometry
        self.title = title
        self.subtitle = subtitle
        self.deal = deal
        self.price = price
        self.oldPrice = oldPrice
        self.image = image
        
        if deal {
            self.priceText = Text("ab ") + Text("\(oldPrice)€ ").fontWeight(.bold).strikethrough() + Text("\(price)€").fontWeight(.bold).foregroundColor(Color("GroverPink")) + Text(" pro Monat")
        } else {
            self.priceText = Text("ab ") +  Text("\(price)€ ").fontWeight(.bold).foregroundColor(Color("GroverPink")) + Text(" pro Monat")
        }
        
    }
    
    
    var body: some View {
        VStack {
            
            HStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: geometry.size.width * 0.2)
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                    Text(subtitle)
                        .padding(.vertical, 8)
                    priceText
                }
                .padding(12)
            }
        }
        .padding()
        .frame(maxWidth: geometry.size.width)
        .background(Color.white)
        .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("GroverLightGrey"), lineWidth: 2)
                )
    }
}
