//
//  HotNoticeBoard.swift
//  Fishome
//
//  Created by 조성빈 on 3/9/24.
//

import Foundation
import SwiftUI

struct HotNoticeBoard: View {
    
    var noticeName: String
    
    var imageName: String
    
    var recWidth: CGFloat
    var recHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(width: recWidth, height: recHeight)
                .cornerRadius(20)
                .foregroundColor(.white)
                .opacity(0.6)
            HStack(alignment: .center) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: recWidth * 0.15)
                Text(noticeName)
            }
            .padding(.vertical, 5)
        }
    }
}
