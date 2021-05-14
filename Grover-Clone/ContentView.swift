//
//  ContentView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - state proerties for showing different views
    @StateObject var viewRouter: ViewRouter
    @State private var showMenu: Bool = false
    @State private var showShoppingBag: Bool = false
    
    // MARK: - state properties for managing user search queries
    @State private var searchTerm: String = ""
    
    // MARK: - products repository
    @ObservedObject var productsRepo: ProductsRepository = ProductsRepository()
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                HeaderView(geometry: geometry, viewRouter: viewRouter, searchTerm: $searchTerm, showMenu: $showMenu)
                
                Spacer()
                
                if self.searchTerm != "" {
                    SearchResults()
                } else {
                    switch viewRouter.currentPage {
                    case .home:
                        ZStack {
                            if self.showMenu {
                                MenuView()
                                    .frame(width: geometry.size.width / 2)
                                    .transition(.move(edge: .leading))
                            }
                            HomeView(geometry: geometry, products: productsRepo.products)
                            .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                            .disabled(self.showMenu ? true : false)
                        }
                    case .shoppingBag:
                        ZStack {
                            if self.showMenu {
                                MenuView()
                                    .frame(width: geometry.size.width / 2)
                                    .transition(.move(edge: .leading))
                            }
                            ShoppingBagView()
                                .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                                .disabled(self.showMenu ? true : false)
                        }
                    case .account:
                        ZStack {
                            if self.showMenu {
                                MenuView()
                                    .frame(width: geometry.size.width / 2)
                                    .transition(.move(edge: .leading))
                            }
                            AccountView()
                                .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                                .disabled(self.showMenu ? true : false)
                        }
                    case .rented:
                        ZStack {
                            if self.showMenu {
                                MenuView()
                                    .frame(width: geometry.size.width / 2)
                                    .transition(.move(edge: .leading))
                            }
                            AccountView()
                                .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                                .disabled(self.showMenu ? true : false)
                        }
                    }
                }
                
                Spacer()
                
                FooterView(viewRouter: viewRouter, geometry: geometry)
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
            }
        }
    }
}
