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
    var price: Float
    var oldPrice: Float
    var discount: Int
    var image: [Image]
    var priceText: Text
    var category: String
    
    @Environment(\.presentationMode) var presentationMode
    
    init(geometry: GeometryProxy, title: String, description: String, deal: Bool, price: Float, discount: Int, category: String, image: [Image], presentDetails: Binding<Bool>) {
        self.geometry = geometry
        self.title = title
        self.description = description
        self.deal = deal
        self.price = price
        self.discount = discount
        self.oldPrice = price + Float(discount)
        self.image = image
        self.category = category
        
        if deal {
            self.priceText = Text("ab ") + Text("\(String(format: "%.2f € ", oldPrice)) ").fontWeight(.bold).strikethrough() + Text("\(String(format: "%.2f € ", price))").fontWeight(.bold).foregroundColor(Color("GroverPink")) + Text(" pro Monat")
        } else {
            self.priceText = Text("ab ") +  Text("\(String(format: "%.2f € ", price))").fontWeight(.bold).foregroundColor(Color("GroverPink")) + Text(" pro Monat")
        }
        
    }
    
    var body: some View {
        VStack {
            ProductDetailsHeader(geometry: geometry,
                                 category: category,
                                 presentationMode: presentationMode)
                .padding(.horizontal, 12)
            
            ScrollView {
                TabView {
                    ForEach(0..<image.count) { index in
                        image[index]
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: geometry.size.height * 0.2)
                            .padding()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height / 3)
                
                ProductDetailsPillView(geometry: geometry,
                                       title: title,
                                       description: description,
                                       deal: deal)
                    .padding(.horizontal, 12)
            }
            
            Spacer()
            
            DetailsFooterView(geometry: geometry,
                              deal: deal,
                              price: price,
                              discount: discount)
                .frame(width: geometry.size.width, height: geometry.size.height/10)
        }
    }
}
