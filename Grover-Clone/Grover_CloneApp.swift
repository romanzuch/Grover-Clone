//
//  Grover_CloneApp.swift
//  Grover-Clone
//
//  Created by Roman on 09.05.21.
//

import SwiftUI
import Firebase

@main
struct Grover_CloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
