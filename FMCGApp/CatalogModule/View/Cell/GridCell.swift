//
//  GridCell.swift
//  FMCGApp
//
//  Created by Анастасия on 09.08.2024.
//

import SwiftUI

struct GridCell: View {
    @State var product: Product
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                ImageView(image: product.image,
                          badge: product.badge,
                          discount: product.discount,
                          rating: product.rating,
                          isRating: true,
                          width: 168)
                
                LikedSet(isLiked: product.isLiked)
            }
            VStack(alignment: .leading) {
                ProductInfo(rating: product.rating,
                            reviews: product.reviews,
                            name: product.name,
                            country: product.countryOfProduction,
                            isList: false)
                Spacer()
                if let pickedItems = product.pickedItems {
                    ProductPicked(count: Double(pickedItems) * product.defaultCountForOneItem,
                                  isCountable: product.isCountable,
                                  plusItem: { product.pickedItems! += 1 },
                                  minuusItem: { 
                        if product.pickedItems ?? 0 < 2 {
                            product.pickedItems = nil
                        } else {
                            product.pickedItems! -= 1
                        }
                    })
                } else {
                    ProductNotPicked(price: product.price,
                                     discount: product.discount,
                                     isCountable: product.isCountable,
                                     pickAction: { 
                        product.pickedItems = 1
                    })
                    
                }
            }
            .padding(.all, 8)
        }
        .frame(width: 168, height: 320)
        .background(RoundedRectangle(cornerRadius: 16)
            .fill(.white)
            .shadow(color: .gray, radius: 4))
        
    }
}

#Preview {
    GridCell(product:Product(name: "test1",
                             image: "Card_image_1",
                             price: 30.99,
                             discount: 0,
                             badge: "badge1",
                             isLiked: false,
                             rating: 4.1,
                             isCountable: false,
                             defaultCountForOneItem: 0.88,
                             pickedItems: 1,
                             countryOfProduction: "France",
                             reviews: 19))
}


#Preview {
    GridCell(product:Product(name: "test1",
                             image: "Card_image_1",
                             price: 30.99,
                             discount: 0,
                             badge: "badge1",
                             isLiked: false,
                             rating: 4.1,
                             isCountable: false,
                             defaultCountForOneItem: 0.88,
                             pickedItems: nil,
                             countryOfProduction: "France",
                             reviews: 19))
}
