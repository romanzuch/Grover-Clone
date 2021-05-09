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
    var subtitle: String
    var deal: Bool
    
    init(geometry: GeometryProxy,
         title: String,
         subtitle: String,
         deal: Bool) {
        self.geometry = geometry
        self.title = title
        self.subtitle = subtitle
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
            }
            Text(title)
                .font(.title2).fontWeight(.bold)
                .foregroundColor(Color("GroverGrey"))
        }
    }
}
