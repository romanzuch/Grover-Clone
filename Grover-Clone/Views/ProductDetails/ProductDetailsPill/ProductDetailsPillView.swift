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
    
    init(geometry: GeometryProxy,
         title: String,
         description: String,
         deal: Bool) {
        self.geometry = geometry
        self.title = title
        self.description = description
        self.deal = deal
    }
    
    var body: some View {
        VStack {
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
                VStack {
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
            
            Group {
                Label("GRATIS Grover Care", systemImage: "umbrella")
                Label("Lieferung in 1-3 Werktagen", systemImage: "bus")
            }
            
            Text("Wähle eine Mindestmietdauer")
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 6.0, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
    }
}
