//
//  HomeAdView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct HomeAdView: View {
    
    var geometry: GeometryProxy
    
    init(geometry: GeometryProxy) {
        self.geometry = geometry
    }
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("KOMM MIET IN DIE ZUKUNFT")
                    .font(.largeTitle).fontWeight(.bold)
                Text("Hol dir die Technik, die du willst, wann du willst. Und zur Feier unseres neuen Looks sparst du 90 % auf den 1. Mietmonat, wenn du 3+ Monate mietest mit dem Code JETZTMIETEN90")
                    .lineSpacing(8)
                    .padding(.top, 12)
            }
            .padding(12)
            
            HStack {
                Link(destination: URL(string: "https://www.grover.com/de-de")!) {
                    Text("Deals entdecken")
                        .fontWeight(.bold)
                        .padding()
                }
                .background(Color("GroverPink"))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
                .padding(.all, 10)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
                Spacer()
            }
            
            
            
        }
        .padding()
        .background(Color("GroverLightBlue"))
        .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
    }
}
