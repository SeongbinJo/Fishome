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
    
    var noticeWidth: CGFloat
    var noticeHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
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
            
            HotNotices()
                .frame(width: noticeWidth, height: noticeHeight)
                .position(x: recWidth / 2, y: recHeight / 1.85)
                
        }
        .frame(width: recWidth, height: recHeight)
    }
}
