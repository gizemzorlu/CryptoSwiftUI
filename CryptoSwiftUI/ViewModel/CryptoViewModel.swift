//
//  CryptoViewModel.swift
//  CryptoSwiftUI
//
//  Created by Gizem Zorlu on 29.11.2023.
//

import Foundation

struct CryptoViewModel {
    
    let crypto: Crypto
    
    var id: UUID? {
        crypto.id
    }
    
    var currency: String {
        crypto.currency
    }
    
    var price: String {
        crypto.price
    }
}
