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
                
                HeaderView(geometry: geometry, viewRouter: viewRouter, searchTerm: $searchTerm)
                
                Spacer()
                
                if self.searchTerm != "" {
                    SearchResults()
                } else {
                    switch viewRouter.currentPage {
                    case .home:
                        HomeView(geometry: geometry, products: productsRepo.products)
                    case .menu:
                        MenuView()
                    case .shoppingBag:
                        ShoppingBagView(products: productsRepo.products)
                            .onAppear {
                                print(productsRepo.products)
                            }
                    case .account:
                        AccountView()
                    }
                }
                
                Spacer()
                
                FooterView(viewRouter: viewRouter, geometry: geometry)
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
            }
        }
    }
}
