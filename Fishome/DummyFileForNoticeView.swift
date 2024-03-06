//
//  DummyFileForNoticeView.swift
//  Fishome
//
//  Created by 조성빈 on 3/6/24.
//

import Foundation


//홈 탭 - 인기 게시글 리스트 모델
struct HotNoticeModel: Identifiable, Codable {
    var id: String
    var detailCategory: String
    var title: String
    var greateCount: Int
    var commentCount: Int
}
