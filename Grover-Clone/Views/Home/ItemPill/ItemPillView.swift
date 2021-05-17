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
    var description: String
    var deal: Bool
    var price: Float
    var oldPrice: Float
    var discount: Int
    var images: [String]
    var priceText: Text
    var category: String
    
    @State var presentDetails: Bool = false
    
    init(geometry: GeometryProxy, title: String, description: String, category: String, deal: Bool, price: Float, discount: Int, images: [String]) {
        self.geometry = geometry
        self.title = title
        self.description = description
        self.deal = deal
        self.price = price
        self.discount = discount
        self.oldPrice = price + Float(discount)
        self.images = images
        self.category = category
        
        if deal {
            self.priceText = Text("ab ").font(.footnote) + Text("\(String(format: "%.2f € ", oldPrice))").fontWeight(.bold).strikethrough() + Text("\(String(format: "%.2f € ", price))").fontWeight(.bold).foregroundColor(Color("GroverPink")) + Text(" pro Monat").font(.footnote)
        } else {
            self.priceText = Text("ab ").font(.footnote) +  Text("\(String(format: "%.2f € ", price))").fontWeight(.bold).foregroundColor(Color("GroverPink")) + Text(" pro Monat").font(.footnote)
        }
        
    }
    
    
    var body: some View {
        VStack {
            
            HStack {
                AsyncImage(
                    url: URL(string: images[0])!,
                    placeholder: { ImageLoaderPlaceholder() }
                )
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: geometry.size.width * 0.2)
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                    Text(description)
                        .padding(.vertical, 8)
                    priceText
                }
                .padding(12)
            }
        }
        .onTapGesture {
            print(title)
            presentDetails.toggle()
        }
        .padding()
        .frame(maxWidth: geometry.size.width)
        .background(Color.white)
        .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("GroverLightGrey"), lineWidth: 2)
                )
        .fullScreenCover(isPresented: $presentDetails, content: {
            ProductDetailView(geometry: geometry,
                              title: title,
                              description: description,
                              deal: deal,
                              price: price,
                              discount: discount,
                              category: category,
                              images: images,
                              presentDetails: $presentDetails
            )
        })
    }
}
