//
//  FooterPriceView.swift
//  Grover-Clone
//
//  Created by Roman on 26.05.21.
//

import SwiftUI

struct PriceTextView: View {
    
    var prices: [Float]
    var discount: Float
    @Binding var selectedDuration: Int?
    
    init(prices: [Float], discount: Float, selectedDuration: Binding<Int?>) {
        self.prices = prices
        self.discount = discount
        self._selectedDuration = selectedDuration
        
    }
    
    var body: some View {
        HStack {
            Text("\(String(format: "%.2f € ", prices[$selectedDuration.wrappedValue ?? 0] - discount))").font(.title3).fontWeight(.bold).strikethrough()
            Text("\(String(format: "%.2f € ", prices[$selectedDuration.wrappedValue ?? 0]))").font(.title).fontWeight(.bold).foregroundColor(Color("GroverPink"))
        }
    }
}
