//
//  NoticeWhaleAndCarp.swift
//  Fishome
//
//  Created by 조성빈 on 3/8/24.
//

import Foundation
import SwiftUI

struct NoticeWhaleAndCarp: View {
    
    var imageName: String
    var imageWidth: CGFloat
    
    var vGridWidth: CGFloat
    
    @State var triangleBtnAction: CGFloat = -1
    
    var testNotices: [typeOfNotice] = []
    
    //게시판 임의 크기
    var circleNoticeWidth: CGFloat
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
            HStack(alignment: .top) {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: self.imageWidth * 0.1), GridItem(.flexible(), spacing: self.imageWidth * 0.1), GridItem(.flexible(), spacing: self.imageWidth * 0.1)]) {
                    ForEach(triangleBtnAction < 0 ? Array(testNotices.prefix(3)) : testNotices, id: \.id) { notice in
                        WhaleAndCarpDetailNoticeBlock(circleWidth: circleNoticeWidth, noticeTitle: notice.noticeTitle)
                    }
                }
                .frame(width: vGridWidth)
//                .background(.blue)
                Button(action: {
                    triangleBtnAction = triangleBtnAction * -1
                }) {
                    Image(systemName: "triangle.fill")
                        .scaleEffect(x: 1, y: triangleBtnAction, anchor: .center)
                        .shadow(radius: 5, x: 0, y: 5)
                        .padding(.top, circleNoticeWidth * 0.4)
//                        .background(.white)
                }
            }
        }
    }
}
