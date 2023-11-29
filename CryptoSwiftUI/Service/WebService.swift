//
//  WebService.swift
//  CryptoSwiftUI
//
//  Created by Gizem Zorlu on 29.11.2023.
//

import Foundation

class WebService {
    
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], DownloaderError>) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
             
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL))
            }
            
            guard let data = data, error == nil else {
               return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([Crypto].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            completion(.success(currencies))
            
        }.resume()
        
    }
}

enum DownloaderError: Error {
    case badURL
    case dataParseError
    case noData
}
