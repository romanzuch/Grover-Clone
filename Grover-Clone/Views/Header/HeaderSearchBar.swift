//
//  HeaderSearchBar.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct HeaderSearchBar: View {
    
    var geometry: GeometryProxy
    @Binding var searchTerm: String
    var height: CGFloat
    var width: CGFloat
    
    init(searchTerm: Binding<String>, geometry: GeometryProxy, width: CGFloat, height: CGFloat) {
        self._searchTerm = searchTerm
        self.geometry = geometry
        self.width = width
        self.height = height
    }
    
    var body: some View {
        TextField("Suche", text: $searchTerm)
            .padding(.horizontal, 24)
            .foregroundColor(.black)
            .frame(width: width, height: height, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: height/2, style: .continuous))
            .shadow(color: .black.opacity(0.25), radius: 5, x: 0.0, y: 0.0)
    }
}
