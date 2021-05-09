//
//  FooterButton.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct FooterButton: View {
    
    var title: String
    var icon: String
    var viewRouter: ViewRouter
    var destination: Page
    var geometry: GeometryProxy
    
    init(title: String, icon: String, viewRouter: ViewRouter, destination: Page, geometry: GeometryProxy) {
        self.title = title
        self.icon = icon
        self.viewRouter = viewRouter
        self.destination = destination
        self.geometry = geometry
    }
    
    var body: some View {
        Button(action: {
            viewRouter.currentPage = destination
        }, label: {
            VStack {
                if icon == "GroverLogo" {
                    Image(icon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(viewRouter.currentPage == destination ? Color("GroverGrey") : Color("GroverLightGrey"))
                        .frame(width: geometry.size.width/12, height: geometry.size.height/28)
                } else {
                    Image(systemName: icon)
                        .resizable()
                        .foregroundColor(viewRouter.currentPage == destination ? Color("GroverGrey") : Color("GroverLightGrey"))
                        .frame(width: geometry.size.width/15, height: geometry.size.height/28)
                }
                Text(title)
                    .foregroundColor(viewRouter.currentPage == destination ? Color("GroverGrey") : Color("GroverLightGrey"))
            }
        })
        .padding(.horizontal, geometry.size.width / 15)
    }
}
