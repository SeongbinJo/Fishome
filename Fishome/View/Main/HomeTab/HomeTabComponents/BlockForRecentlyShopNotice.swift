//
//  BlockForRecentlyShopNotice.swift
//  Fishome
//
//  Created by 조성빈 on 3/7/24.
//

import Foundation
import SwiftUI

struct BlockForRecentlyShopNotice: View {
    

    
    var recWidth: CGFloat
    var recHeight: CGFloat
    
    var imagename: String
    
    var price: Int
    var title: String
    
    var body: some View {
        Button(action: {
            print("장터 최신 게시글 눌림.")
        }) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Rectangle()
                        .frame(width: recWidth, height: recHeight)
                        .cornerRadius(20)
                        .overlay {
                            Image(systemName: imagename)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: recWidth * 0.7)
                                .foregroundColor(.white)
                        }
        //                .shadow(radius: 5, x: 0, y: 5)
                    Button(action: {
                        print("장터 최신 게시글 좋아요 눌림.")
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: recWidth * 0.2)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                }
                Text("\(price)원")
                Text(title)
            }
        }
    }
}
