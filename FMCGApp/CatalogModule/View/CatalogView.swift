//
//  ContentView.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import SwiftUI

struct CatalogView: View {
    @StateObject var viewModel: CatalogViewModel = .init()
    @State var isList: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            //TODO: change on navBar button
            HStack {
                Button {
                    isList.toggle()
                } label: {
                    Image(isList ? "chip1" : "chip2")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                Spacer()
            }
            Divider()
            
            if !isList {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 8) {
                        ForEach(viewModel.products) { product in
                            GridCell(product: product)
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                }
            } else {
                List(viewModel.products, id: \.id) { product in
                    ListCell(product: product)
                        .buttonStyle(.borderless)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowBackground(Color.white)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            Spacer()
        }
    }
}

#Preview {
    CatalogView()
}
