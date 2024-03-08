//
//  WhaleAndCarpDetailNoticeBlock.swift
//  Fishome
//
//  Created by 조성빈 on 3/8/24.
//

import Foundation
import SwiftUI

struct WhaleAndCarpDetailNoticeBlock: View {
    
    var circleWidth: CGFloat
    
    var noticeTitle: String
    
    var body: some View {
        Button(action: {
            print("\(noticeTitle) 게시판 눌림.")
        }) {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: circleWidth)
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .shadow(radius: 5, x: 0, y: 5)
                Text(noticeTitle)
            }
        }
    }
}
