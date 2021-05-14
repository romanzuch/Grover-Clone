//
//  HeaderView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct HeaderView: View {
    
    var geometry: GeometryProxy
    var viewRouter: ViewRouter
    @Binding var searchTerm: String
    @Binding var showMenu: Bool
    
    init(geometry: GeometryProxy, viewRouter: ViewRouter, searchTerm: Binding<String>, showMenu: Binding<Bool>) {
        self.geometry = geometry
        self.viewRouter = viewRouter
        self._searchTerm = searchTerm
        self._showMenu = showMenu
    }
    
    var body: some View {
        HStack {
            HeaderMenuButton(height: geometry.size.height * 0.0669, width: geometry.size.width * 0.1449, icon: "circle.grid.3x3.fill", showMenu: $showMenu)
            
            HeaderSearchBar(searchTerm: $searchTerm, geometry: geometry, width: geometry.size.width - (geometry.size.width * 0.2898 + 48), height: geometry.size.height * 0.0669)
            
            HeaderButton(height: geometry.size.height * 0.0669, width: geometry.size.width * 0.1449, icon: "bag", destination: Page.shoppingBag, viewRouter: viewRouter)
        }
        .padding(.horizontal, 12)
    }
}
