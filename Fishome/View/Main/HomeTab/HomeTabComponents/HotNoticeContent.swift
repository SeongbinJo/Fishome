//
//  HotNotices.swift
//  Fishome
//
//  Created by 조성빈 on 3/6/24.
//

import Foundation
import SwiftUI

struct HotNoticeContent: View {
    
    var recWidth: CGFloat
    var recHeight: CGFloat
    
    var dummyNotice: [NoticeModel] = [
        NoticeModel(id: UUID().uuidString, firstCategory: "자유", detailCategory: "", title: "내가 자유 게시판 좋아요 TOP이다.", content: "유저 없어서 자유 게시판도 좋아요 TOP 가려면 좋아요 3개면 끝이죠?ㅋㅋㅋ", image: "이미지", nickname: "자유남바완", greateCount: 3, commentCount: 6, date: Date()),
    ]
    
    var body: some View {
        VStack {
            ForEach(dummyNotice, id: \.id) { dummy in
                VStack(alignment: .leading) {
                    HStack {
                        Text(dummy.nickname)
                        Spacer()
                        Text(dummy.formattedTime)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(dummy.title)
                        Text(dummy.content)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    HStack(spacing: 2) {
                        Text(dummy.detailCategory)
                        Spacer()
                        Image(systemName: "heart.fill")
                        Text("\(dummy.greateCount)")
                        Image(systemName: "message.fill")
                        Text("\(dummy.commentCount)")
                    }
                }
            }
        }
        .frame(width: recWidth, height: recHeight)
        .padding(.vertical)
    }
}
