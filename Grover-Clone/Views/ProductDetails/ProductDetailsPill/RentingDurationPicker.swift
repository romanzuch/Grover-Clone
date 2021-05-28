//
//  RentingDurationPicker.swift
//  Grover-Clone
//
//  Created by Roman on 26.05.21.
//

import SwiftUI

struct RentingDurationPicker: View {
    
    var prices: [Float]
    var geometry: GeometryProxy
    @Binding var selectedDuration: Int
    
    init(prices: [Float], geometry: GeometryProxy, selectedDuration: Binding<Int>) {
        self.prices = prices
        self.geometry = geometry
        self._selectedDuration = selectedDuration
    }
    
    var body: some View {
        HStack {
            ForEach((0..<prices.count).reversed(), id: \.self) { index in
                switch index {
                case 0:
                    if selectedDuration == 0 {
                        Text("12").font(.system(size: 18)).foregroundColor(.red).bold()
                    } else {
                        Text("12").font(.system(size: 18))
                            .onTapGesture {
                                selectedDuration = 0
                            }
                    }
                case 1:
                    if selectedDuration == 1 {
                        Text("6").font(.system(size: 18)).foregroundColor(.red).bold()
                    } else {
                        Text("6").font(.system(size: 18))
                            .onTapGesture {
                                selectedDuration = 1
                            }
                    }
                case 2:
                    if selectedDuration == 2 {
                        Text("3").font(.system(size: 18)).foregroundColor(.red).bold()
                    } else {
                        Text("3").font(.system(size: 18))
                            .onTapGesture {
                                selectedDuration = 2
                            }
                    }
                case 3:
                    if selectedDuration == 3 {
                        Text("1").font(.system(size: 18)).foregroundColor(.red).bold()
                    } else {
                        Text("1").font(.system(size: 18))
                            .onTapGesture {
                                selectedDuration = 3
                            }
                    }
                default:
                    Text("1")
                }
            }
            .padding(.horizontal, geometry.size.width / 20)
            .padding(.vertical, 24)
        }
        .frame(maxWidth: geometry.size.width, maxHeight: 84)
        .overlay(
            RoundedRectangle(cornerRadius: 48)
            .stroke(Color("GroverLightGrey"), lineWidth: 2)
        )
    }
}
