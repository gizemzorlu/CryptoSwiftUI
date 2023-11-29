//
//  CryptoViewModel.swift
//  CryptoSwiftUI
//
//  Created by Gizem Zorlu on 29.11.2023.
//

import Foundation

class CryptoListViewModel: ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let service = WebService()
    
    func downloadCryptos(url: URL) {
        
        service.downloadCurrencies(url: url) { result in
            
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let cryptos):
                DispatchQueue.main.async {
                    self.cryptoList = cryptos.map(CryptoViewModel.init)
                }
            }
        }
    }
}
    
