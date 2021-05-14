//
//  HeaderMenuButton.swift
//  Grover-Clone
//
//  Created by Roman on 14.05.21.
//

import SwiftUI

struct HeaderMenuButton: View {
    var height: CGFloat
    var width: CGFloat
    var icon: String
    @Binding var showMenu: Bool
    
    init(height: CGFloat, width: CGFloat, icon: String, showMenu: Binding<Bool>) {
        self.height = height
        self.width = width
        self.icon = icon
        self._showMenu = showMenu
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                showMenu.toggle()
            }
        }, label: {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: width, height: height)
                .background(Color.white)
                .clipShape(Circle())
        })
        .shadow(color: .black.opacity(0.25), radius: 5, x: 0.0, y: 0.0)
    }
}
