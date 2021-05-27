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
                ForEach((0..<prices.count).reversed(), id: \.self) { index in
                    switch index {
                    case 0:
                        Text("12")
                    case 1:
                        Text("6")
                    case 2:
                        Text("3")
                    case 3:
                        Text("1")
                    default:
                        Text("1")
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
