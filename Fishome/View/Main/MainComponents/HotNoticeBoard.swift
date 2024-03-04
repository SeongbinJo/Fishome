//
//  HotNoticeBoard.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI

struct HotNoticeBoard: View {
    
    var titleName: String
    
    var recWidth: CGFloat
    var recHeight: CGFloat
    
    var titleRecWidth: CGFloat
    var titleRecHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .frame(width: recWidth, height: recHeight)
                .cornerRadius(20)
                .foregroundColor(.white)
                .opacity(0.6)
                .shadow(radius: 5, x: 0, y: 5)
            ZStack {
                Rectangle()
                    .frame(width: titleRecWidth, height: titleRecHeight)
                    .clipShape(
                        .rect(
                        topLeadingRadius: 20,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 20,
                        topTrailingRadius: 0))
                    .foregroundColor(.yellow)
                Text(titleName)
            }
        }
    }
}
