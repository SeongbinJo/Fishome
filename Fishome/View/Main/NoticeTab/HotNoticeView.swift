//
//  HotNoticeView.swift
//  Fishome
//
//  Created by 조성빈 on 3/8/24.
//

import Foundation
import SwiftUI

struct hotboardModel: Identifiable, Codable {
    var id: String
    var noticeName: String
    var noticeImage: String
}

struct HotNoticeView: View {
    
    @Binding var naviPathNoticeView: NavigationPath
    
    var nameOfHotNoticeBoard: [hotboardModel] = [
        hotboardModel(id: UUID().uuidString, noticeName: "자유", noticeImage: "Fishome_FreeBoardIcon"),
        hotboardModel(id: UUID().uuidString, noticeName: "해수어", noticeImage: "Fishome_Whale"),
        hotboardModel(id: UUID().uuidString, noticeName: "열대어", noticeImage: "Fishome_Carp")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(nameOfHotNoticeBoard, id: \.id) { value in
                    ZStack(alignment: .topLeading) {
                        HotNoticeBoard(noticeName: value.noticeName, imageName: value.noticeImage, recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height)
                            .padding(.vertical, 5)
                        Button(action: {
                            print("게시판 탭으로 이동합니다.(인기 게시판 - 뒤로가기)")
                            naviPathNoticeView.removeLast()
                        }) {
                            ZStack {
                                Rectangle()
                                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.05)
                                    .foregroundColor(.white)
                                    .opacity(0.6)
                                    .cornerRadius(20)
                                Text("뒤로가기")
                            }
                            .padding()
                        }
                    }
                }
            }
            .tabViewStyle(.page)
            .frame(width: geometry.size.width, height: geometry.size.height)
                
                .navigationBarBackButtonHidden()
                .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NaviLeadingItem(eggCount: 1200)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NaviTrailingItem()
                }
            }
            .toolbarBackground(.automatic)
        }
        .background(.yellow)
    }
}
