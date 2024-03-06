//
//  HotNotices.swift
//  Fishome
//
//  Created by 조성빈 on 3/6/24.
//

import Foundation
import SwiftUI

struct HotNotices: View {
    
    var dummyNotice: [HotNoticeModel] = [
        HotNoticeModel(id: UUID().uuidString, detailCategory: "상세 카테고리 1", title: "인기 게시글123213dsfㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴ 제목 1", greateCount: 12, commentCount: 4),
        HotNoticeModel(id: UUID().uuidString, detailCategory: "상세 카테고리 2", title: "인기 게시글123213dsfㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴ 제목 2", greateCount: 10, commentCount: 6),
        HotNoticeModel(id: UUID().uuidString, detailCategory: "상세 카테고리 4", title: "인기 게시글123213dsfㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴ 제목 3", greateCount: 10, commentCount: 11),
        HotNoticeModel(id: UUID().uuidString, detailCategory: "상세 카테고리 2", title: "인기 게시글123213dsfㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴ 제목 4", greateCount: 7, commentCount: 2),
        HotNoticeModel(id: UUID().uuidString, detailCategory: "상세 카테고리 3", title: "인기 게시글123213dsfㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴ 제목 5", greateCount: 6, commentCount: 8),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(dummyNotice, id: \.id) { dummy in
                HStack(alignment: .center) {
                    Text("[\(dummy.detailCategory)]")
                    Text(dummy.title)
                    HStack(spacing: 2) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                        Text("\(dummy.greateCount)")
                    }
                    HStack(spacing: 2) {
                        Image(systemName: "message.fill")
                            .foregroundColor(.gray)
                        Text("\(dummy.commentCount)")
                    }
                    
                }
            }
        }
    }
}
