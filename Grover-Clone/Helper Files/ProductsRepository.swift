//
//  ProductsRepository.swift
//  Grover-Clone
//
//  Created by Roman on 10.05.21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProductsRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var products = [Product]()
    
    init() {
        DispatchQueue.main.async {
            self.loadData()
        }
    }
    
    func loadData() {
        self.db.collection("products")
        .addSnapshotListener { [self] (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.products = querySnapshot.documents.compactMap { document in
                    do {
                        let data = try document.data(as: Product.self)
                        return data
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
}

struct Product: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var category: String
    var colors: [String]
    var deal: Bool
    var description: String
    var discount: Int
    var images: [String]
    var name: String
    var prices: [Float]
    var rating: Float
}
