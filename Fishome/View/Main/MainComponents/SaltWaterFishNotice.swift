//
//  SaltWaterFishNotice.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI

struct SaltWaterFishNotice: View {

    var recWidth: CGFloat
    var recHeight: CGFloat

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Rectangle()
                .frame(width: recWidth, height: recHeight)
                .cornerRadius(20)
                .foregroundColor(.white)
                .opacity(0.6)
                .shadow(radius: 5, x: 0, y: 5)
            Button(action: {
                
            }){
                Text("더보기")
            }
        }
    }
}
