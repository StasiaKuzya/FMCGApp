//
//  ProductInfo.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import SwiftUI

struct ProductInfo: View {
    var rating: Double?
    var reviews: Int?
    var name: String
    var country: String?
    var isList: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if isList {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.yellow)
                    Text(String(rating ?? 0))
                    Rectangle()
                        .frame(width: 1,height: 16)
                        .tint(.gray)
                        .opacity(0.5)
                    Text(String(reviews ?? 0) + " отзывов")
                        .foregroundStyle(.gray)
                }
            }
            Text(name)
                .lineLimit(2)
            
            if let country {
                Text(country)
                    .foregroundStyle(.gray)
            }
        }
        .font(.callout)
    }
}

#Preview {
    ProductInfo(rating: 4.5, 
                reviews: 22,
                name: "testtest test  tes tes test",
                country: "Франция",
                isList: true)
}
