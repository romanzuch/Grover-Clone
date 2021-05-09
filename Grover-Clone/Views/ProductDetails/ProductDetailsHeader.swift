//
//  ProductDetailsHeader.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct ProductDetailsHeader: View {
    
    var geometry: GeometryProxy
    @Binding var presentationMode: PresentationMode
    
    init(geometry: GeometryProxy, presentationMode: Binding<PresentationMode>) {
        self.geometry = geometry
        self._presentationMode = presentationMode
    }
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "chevron.backward")
                Text("Kategorie")
                    .font(.subheadline).fontWeight(.light)
            }
            Spacer()
            Button(action: {
                $presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.1449, height: geometry.size.height * 0.0669)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0.0, y: 0.0)
            })
        }
    }
}
