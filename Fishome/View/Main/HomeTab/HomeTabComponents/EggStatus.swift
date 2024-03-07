//
//  EggStatus.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI

struct EggStatus: View {
    
    var recWidth: CGFloat
    var recHeight: CGFloat
    
    var imageWidth: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: recWidth, height: recHeight)
                .cornerRadius(20)
                .foregroundColor(.white)
                .opacity(0.6)
                .shadow(radius: 5, x: 0, y: 5)
            HStack {
                Image("Fishome_Egg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth)
                    .padding(.leading, 25)
                VStack {
                    Text("부화 중")
                    Text("1200")
                }
                Spacer()
            }
        }
    }
}
