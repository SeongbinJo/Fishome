//
//  HomeView.swift
//  Fishome
//
//  Created by 조성빈 on 3/5/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    var noticeName: [String] = ["전체", "해수어", "열대어", "장터"]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                //알 상태 확인 뷰
                EggStatus(recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.11, imageWidth: geometry.size.width * 0.18)
                    .padding(.top)
                //인기 게시글 뷰
                VStack(alignment: .leading, spacing: 4) {
                    Text("인기 게시글")
                        .padding(.top, 2)
                        .padding(.leading, geometry.size.width * 0.05)
                    TabView {
                        ForEach(noticeName, id: \.self) { name in
                            HotNoticeBoard(titleName: name, recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.3, titleRecWidth: geometry.size.width * 0.2, titleRecHeight: geometry.size.height * 0.05, noticeWidth: geometry.size.width * 0.8, noticeHeight: geometry.size.height * 0.2)
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.32)
                    .padding(.top, geometry.size.height * -0.01)
                }
                //전체 게시글 뷰
                VStack(alignment: .leading, spacing: 4) {
                    Text("자유 게시판")
                    NoticeComponents(recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.3)
                }
                //해수어 게시글 뷰
                VStack(alignment: .leading, spacing: 4) {
                    Text("해수어 게시판")
                    NoticeComponents(recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.3)
                }
                //열대어 게시글 뷰
                VStack(alignment: .leading, spacing: 4) {
                    Text("열대어 게시판")
                    NoticeComponents(recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.3)
                        .padding(.bottom, geometry.size.height * 0.1)
                }
            }
            .frame(width: geometry.size.width)
            .background(Color.blue)
        }   
    }
}
