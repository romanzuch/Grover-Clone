//
//  FeedHeader.swift
//  Grover-Clone
//
//  Created by Roman on 06.12.21.
//

import SwiftUI

struct FeedHeader: View {
    
    var path: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: -5))
            path.addLine(to: CGPoint(x: 300, y: -5))
        }
        .fill(.blue)
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text("DEIN FEED")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .padding(.leading, 8)
                Spacer()
            }
            path
        }
    }
}
