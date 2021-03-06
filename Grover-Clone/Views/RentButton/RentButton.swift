//
//  RentButton.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct RentButton: View {
    
    var productId: String
    var selectedDuration: Int
    
    init(productId: Float, selectedDuration: Int) {
        self.productId = String(productId)
        self.selectedDuration = selectedDuration
    }
    
    var body: some View {
        Button(action: {
            print(productId)
            print(selectedDuration)
        }, label: {
            Text("Mieten")
                .fontWeight(.bold)
                .padding()
        })
        .background(Color("GroverPink"))
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
        .padding(.all, 10)
        .shadow(color: .black.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
    }
}
