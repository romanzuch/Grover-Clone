//
//  ProductDetailsPillView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct ProductDetailsPillView: View {
    
    var geometry: GeometryProxy
    var title: String
    var description: String
    var deal: Bool
    var prices: [Float]
    
    @Binding var selectedDuration: Int
    
    init(geometry: GeometryProxy, product: Product, selectedDurationPassed: Binding<Int>) {
        self.geometry = geometry
        self.title = product.name
        self.description = product.description
        self.deal = product.deal
        self.prices = product.prices
        self._selectedDuration = selectedDurationPassed
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                if deal {
                    Text("Deal")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 12)
                        .background(Color("GroverPink"))
                        .clipShape(RoundedRectangle(cornerRadius: 6.0, style: .continuous))
                }
                Spacer()
                HStack {
                    Image(systemName: "heart")
                        .padding(2)
                    Image(systemName: "square.and.arrow.up")
                        .padding(2)
                }
                .foregroundColor(Color("GroverGrey"))
                .padding(.trailing, 4)
            }
            
            Group {
                Text(title)
                    .font(.title2).fontWeight(.bold)
                    .foregroundColor(Color("GroverGrey"))
                Text(description)
                    .padding(.vertical, 8)
            }
            
            HStack {
                Image(systemName: "umbrella")
                let groverCareText: Text = Text("GRATIS").foregroundColor(.green) + Text(" Grover Care")
                groverCareText
            }
            HStack {
                Image(systemName: "bus")
                let shippingDuration: String = "1-3"
                let groverShippingText: Text = Text("Liefering in \(shippingDuration) Werktagen")
                groverShippingText
            }
            
            Text("Wähle eine Mindestmietdauer")
            
            RentingDurationPicker(prices: prices, geometry: geometry, selectedDuration: $selectedDuration)
                .padding(.horizontal, 12)
                .padding(.vertical, 24)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 6.0, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
    }
}
