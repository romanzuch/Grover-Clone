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
    
    init(geometry: GeometryProxy, viewRouter: ViewRouter, searchTerm: Binding<String>) {
        self.geometry = geometry
        self.viewRouter = viewRouter
        self._searchTerm = searchTerm
    }
    
    var body: some View {
        HStack {
            HeaderButton(height: geometry.size.height * 0.0669, width: geometry.size.width * 0.1449, destination: Page.menu, icon: "circle.grid.3x3.fill", viewRouter: viewRouter)
            
            HeaderSearchBar(searchTerm: $searchTerm, geometry: geometry, width: geometry.size.width - (geometry.size.width * 0.2898 + 48), height: geometry.size.height * 0.0669)
            
            HeaderButton(height: geometry.size.height * 0.0669, width: geometry.size.width * 0.1449, destination: Page.shoppingBag, icon: "bag", viewRouter: viewRouter)
        }
        .padding(.horizontal, 12)
    }
}
