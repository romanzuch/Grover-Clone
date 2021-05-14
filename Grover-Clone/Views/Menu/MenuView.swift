//
//  MenuView.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI

struct MenuView: View {
    
    var categories: [Category]
    
    init(categories: [Category]) {
        self.categories = categories
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                ForEach(categories[0].names, id:\.self) { category in
                    Text(category)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
