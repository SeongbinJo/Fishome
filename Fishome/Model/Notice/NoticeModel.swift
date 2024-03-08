//
//  DummyFileForNoticeView.swift
//  Fishome
//
//  Created by 조성빈 on 3/6/24.
//

import Foundation
import SwiftUI


//홈 탭 - 인기 게시글 리스트 모델[테스트]
struct HotNoticeModel: Identifiable, Codable {
    var id: String
    var detailCategory: String
    var title: String
    var content: String
    var greateCount: Int
    var commentCount: Int
    var nickname: String
    var date: Date
    
    var formattedTime: String {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ko")
                dateFormatter.dateFormat = "yy/MM/dd HH:MM"
                return dateFormatter.string(from: date)
            }
}

//홈 탭 - 장터 최신 게시글 모델 [테스트]
struct RecentlyShopModel: Identifiable, Codable {
    var id: String
    var category: String
    var title: String
    var content: String
    var price: Int
    var image: String
    var nickname: String
    var greateCount: Int
    var commentCount: Int
    var date: Date
    
    var formattedTime: String {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ko")
                dateFormatter.dateFormat = "yy/MM/dd HH:MM"
                return dateFormatter.string(from: date)
            }
}

//게시판 탭 - 해수어/열대어 별 게시판 종류 출력을 위한 모델 [테스트]
struct typeOfNotice: Identifiable, Codable {
    var id: String
    var firstCategory: String
    var noticeTitle: String
}

//모든 게시글(장터 제외) 모델 - greateCount로 좋아요 TOP 게시글 선정
struct NoticeModel: Identifiable, Codable {
    var id: String
    var firstCategory: String
    var detailCategory: String
    var title: String
    var content: String
    var image: String
    var nickname: String
    var greateCount: Int
    var commentCount: Int
    var date: Date
    
    var formattedTime: String {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ko")
                dateFormatter.dateFormat = "yy/MM/dd HH:MM"
                return dateFormatter.string(from: date)
            }
}
