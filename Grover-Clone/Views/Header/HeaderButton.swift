//
//  HeaderButton.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct HeaderButton: View {
    
    var height: CGFloat
    var width: CGFloat
    var icon: String
    var viewRouter: ViewRouter
    var destination: Page
    
    init(height: CGFloat, width: CGFloat, icon: String, destination: Page, viewRouter: ViewRouter) {
        self.height = height
        self.width = width
        self.destination = destination
        self.icon = icon
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        Button(action: {
            if viewRouter.currentPage == destination {
                viewRouter.currentPage = Page.home
            } else {
                viewRouter.currentPage = destination
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
