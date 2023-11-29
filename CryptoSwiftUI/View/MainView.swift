//
//  ContentView.swift
//  CryptoSwiftUI
//
//  Created by Gizem Zorlu on 29.11.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = CryptoListViewModel()
    
    init(viewModel: CryptoListViewModel = CryptoListViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.cryptoList, id: \.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(crypto.price)
                        .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.navigationTitle("Crypto Crazy")
        }.onAppear {
            viewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json")!)
        }
    }
}
#Preview {
    MainView()
}
