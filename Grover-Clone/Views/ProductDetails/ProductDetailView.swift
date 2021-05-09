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
    var subtitle: String
    var deal: Bool
    var price: String
    var oldPrice: String
    var image: Image
    var priceText: Text
    
    @Environment(\.presentationMode) var presentationMode
    
    init(geometry: GeometryProxy, title: String, subtitle: String, deal: Bool, price: String, oldPrice: String, image: Image, presentDetails: Binding<Bool>) {
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
            ProductDetailsHeader(geometry: geometry,
                                 presentationMode: presentationMode)
                .padding(.horizontal, 12)
            
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: geometry.size.height * 0.2)
                .padding()
            
            ProductDetailsPillView(geometry: geometry,
                                   title: title,
                                   subtitle: subtitle,
                                   deal: deal)
                .padding(.horizontal, 12)
            
            Spacer()
            
            DetailsFooterView(geometry: geometry,
                              deal: deal,
                              price: price,
                              oldPrice: oldPrice)
                .frame(width: geometry.size.width, height: geometry.size.height/10)
        }
    }
}
