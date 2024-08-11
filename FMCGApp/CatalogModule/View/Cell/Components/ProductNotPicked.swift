//
//  ProductNotPicked.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import SwiftUI

struct ProductNotPicked: View {
    var price: Double
    var discount: Double?
    var isCountable: Bool
    var pickAction: () -> Void
    
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(String(price) + (" ₽/\(isCountable ? "шт" : "кг")"))
                        .font(.headline)
                        .bold()

                    if let discount = discount {
                        let discountedPrice = price * (1 - discount)
                        Text(String(format: "%.2f", discountedPrice))
                            .font(.callout)
                            .foregroundStyle(.gray)
                            .strikethrough()
                    }
                }
                
                Spacer()
                Button {
                    pickAction()
                } label: {
                    Image("counter").resizable().frame(width: 48, height: 36)
                }
            }
            .padding(.vertical, 4)
    }
}

#Preview {
    ProductNotPicked(price: 399.00, discount: 0.1099, isCountable: false, pickAction: {})
}
