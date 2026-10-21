//
//  ProductStore.swift
//  ExpiryTracker
//
//  Created by Manaf Akberov on 20.10.26.
//

import Foundation

class ProductStore {
    private let fileURL: URL
    
    init() {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        fileURL = documents.appendingPathComponent("products.json")
    }
    
    func load() -> [Product] {
        guard let data = try? Data(contentsOf: fileURL) else  { return [] }
        return (try? JSONDecoder().decode([Product].self, from: data)) ?? []
    }
    
    func save (_ products: [Product]) {
        guard let data = try? JSONEncoder().encode(products) else { return }
        try? data.write(to: fileURL)
    }
    
}
