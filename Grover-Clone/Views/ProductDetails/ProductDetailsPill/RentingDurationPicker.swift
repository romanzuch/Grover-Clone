//
//  RentingDurationPicker.swift
//  Grover-Clone
//
//  Created by Roman on 26.05.21.
//

import SwiftUI

struct RentingDurationPicker: View {
    
    var prices: [Float]
    @Binding var selectedDuration: Int
    
    init(prices: [Float], selectedDuration: Binding<Int>) {
        self.prices = prices
        self._selectedDuration = selectedDuration
    }
    
    var body: some View {
        HStack {
            Picker("", selection: $selectedDuration) {
                ForEach(0..<prices.count, id: \.self) { price in
                    Text("\(price)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
