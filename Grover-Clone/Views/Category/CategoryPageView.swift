//
//  CategoryPageView.swift
//  Grover-Clone
//
//  Created by Roman on 14.05.21.
//

import SwiftUI

struct CategoryPageView: View {
    
    var category: String
    
    init(category: String) {
        self.category = category
    }
    
    var body: some View {
        Text(category)
    }
}
