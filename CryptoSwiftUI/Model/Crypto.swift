//
//  Crypto.swift
//  CryptoSwiftUI
//
//  Created by Gizem Zorlu on 29.11.2023.
//

import Foundation

struct Crypto: Hashable, Codable, Identifiable {
    
    let id = UUID()
    let currency: String
    let price: String
    
    private enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
