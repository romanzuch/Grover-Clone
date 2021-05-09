//
//  FooterView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct FooterView: View {
    
    var viewRouter: ViewRouter
    var geometry: GeometryProxy
    
    init(viewRouter: ViewRouter, geometry: GeometryProxy) {
        self.viewRouter = viewRouter
        self.geometry = geometry
    }
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.bottom)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
            HStack {
                FooterButton(title: "Für dich", icon: "GroverLogo", viewRouter: viewRouter, destination: Page.home, geometry: geometry)
                FooterButton(title: "Gemietet", icon: "homepod.2", viewRouter: viewRouter, destination: Page.menu, geometry: geometry)
                FooterButton(title: "Konto", icon: "person.circle", viewRouter: viewRouter, destination: Page.account, geometry: geometry)
            }
            .padding(.bottom, -12)
        }
    }
}
