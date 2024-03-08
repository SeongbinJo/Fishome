//
//  NoticeView.swift
//  Fishome
//
//  Created by 조성빈 on 3/6/24.
//

import Foundation
import SwiftUI

struct NoticeView: View {
    
    //인기 게시글, 자유게시판 등 각 종 게시판 이동 시 사용할 Path(NavigationStack)
    @State var naviPathNoticeView: NavigationPath = NavigationPath()
    
    //해수어 임의 게시판
    let testNotices = [typeOfNotice(id: UUID().uuidString, firstCategory: "해수어", noticeTitle: "해수어 전체"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "해수어", noticeTitle: "F/O"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "해수어", noticeTitle: "짬뽕항"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "해수어", noticeTitle: "어항"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "해수어", noticeTitle: "해수항 장비"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "해수어", noticeTitle: "산호/말미잘"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "해수어", noticeTitle: "[관리자 임의 생성 게시판]")]
    //열대어 임의 게시판
    let testNotices1 = [typeOfNotice(id: UUID().uuidString, firstCategory: "열대어", noticeTitle: "열대어 전체"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "열대어", noticeTitle: "수초"),
                       typeOfNotice(id: UUID().uuidString, firstCategory: "열대어", noticeTitle: "가재/새우 갑각류")]
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $naviPathNoticeView) {
                ScrollView {
                    HStack() {
                        //인기, 자유 게시판은 이미지이름, 게시판 이름을 따로 배열에 넣어서 foreach로 생성해도 좋을듯.
                        //인기 게시판 버튼
                        NoticeBlock(naviPathNoticeView: $naviPathNoticeView, recWidth: geometry.size.width * 0.41, recHeight: geometry.size.height * 0.25, imageName: "Fishome_HotNoticeIcon", blockTitle: "인기 게시판", imageWidth: geometry.size.width * 0.22)
                        Spacer()
                        //자유 게시판 버튼
                        NoticeBlock(naviPathNoticeView: $naviPathNoticeView, recWidth: geometry.size.width * 0.41, recHeight: geometry.size.height * 0.25, imageName: "Fishome_FreeBoardIcon", blockTitle: "자유 게시판", imageWidth: geometry.size.width * 0.29)
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.26)
                    .padding(.top)
                    NoticeWhaleAndCarp(imageName: "Fishome_Whale", imageWidth: geometry.size.width * 0.4, vGridWidth: geometry.size.width * 0.82, testNotices: testNotices, circleNoticeWidth: geometry.size.width * 0.25)
                        .frame(width: geometry.size.width)
                    //                    .background(.red)
                    NoticeWhaleAndCarp(imageName: "Fishome_Carp", imageWidth: geometry.size.width * 0.4, vGridWidth: geometry.size.width * 0.82, testNotices: testNotices1, circleNoticeWidth: geometry.size.width * 0.25)
                        .frame(width: geometry.size.width)
                    //                    .background(.red)
                        .padding(.top)
                        .padding(.bottom, geometry.size.height * 0.1)
                }
                .frame(width: geometry.size.width)
                .background(.yellow)
            }
        }
    }
}
