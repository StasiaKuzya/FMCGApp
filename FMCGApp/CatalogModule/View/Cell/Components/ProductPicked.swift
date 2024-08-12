//
//  ProductPicked.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import SwiftUI

struct ProductPicked: View {
    var count: Double?
    var isCountable: Bool
    var plusItem: () -> Void
    var minuusItem: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 0) {
                Text("Шт")
                    .foregroundStyle(isCountable ? .black : .gray)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(isCountable ? .white : .clear))
                    .padding(2)
                Text("Кг")
                    .foregroundStyle(!isCountable ? .black : .gray)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(!isCountable ? .white : .clear))
                    .padding(2)
            }
            .background( RoundedRectangle(cornerRadius: 12).fill(.gray).opacity(0.3)
                .frame(height: 28))
            
            HStack {
                Button {
                    minuusItem()
                } label: {
                    Image(systemName: "minus").font(.headline).foregroundStyle(.white).bold()
                }
                
                VStack(spacing: 0) {
                    Text(String(count ?? 0) + (isCountable ? " шт" : " кг"))
                        .font(.headline)
                        .bold()
                    Text("₽/\(isCountable ? " шт" : " кг")")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                
                Button {
                    plusItem()
                } label: {
                    Image(systemName: "plus").font(.headline).foregroundStyle(.white).bold()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .background(RoundedRectangle(cornerRadius: 30.0).fill(.dGreen))
        }
    }
}

#Preview {
    ProductPicked(count: 0.1, isCountable: false, plusItem: {}, minuusItem: {})
}

#Preview {
    ProductPicked(count: 1, isCountable: true, plusItem: {}, minuusItem: {})
}
