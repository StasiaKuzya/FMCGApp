//
//  LikedSet.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import SwiftUI

struct LikedSet: View {
    @State var isLiked: Bool
    
    var body: some View {
        VStack() {
            Image("icon1")
                .padding(.all, 8)
            Button {
                isLiked.toggle()
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .renderingMode(.template)
                    .foregroundStyle(isLiked ? .dGreen : .gray)
            }
            .padding(.all, 8)
        }
    }
}

#Preview {
    LikedSet(isLiked: false)
}
