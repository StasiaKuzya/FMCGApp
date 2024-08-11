//
//  ImageView.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import SwiftUI

struct ImageView: View {
    var image: String?
    var badge: String?
    var discount: Double?
    var rating: Double?
    var isRating: Bool
    var width: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ZStack(alignment: .topLeading) {
                Image(image ?? "placeholder")
                    .resizable()
                    .frame(width: width, height: width)
                    .foregroundStyle(.yellow)
                if let badge {
                    Image(badge)
                }
            }
            HStack {
                if isRating {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.yellow)
                    Text(String(rating ?? 0))
                }
                
                Spacer()
                
                if let discount {
                    Text(String(Int(discount * 100)) + " %")
                        .font(.headline).bold()
                        .foregroundStyle(.dRed)
                }
            }
            .padding(.all, 4)
        }
        .frame(width: width, height: width)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ImageView(image: "Card_image_1", badge: "badge1", discount: 0.255, rating: 4.2, isRating: true, width: 144)
}
