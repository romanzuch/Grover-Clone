//
//  ViewRouter.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}

enum Page {
    case home
    case menu
    case shoppingBag
    case account
}
