//
//  HotNoticeView.swift
//  Fishome
//
//  Created by 조성빈 on 3/8/24.
//

import Foundation
import SwiftUI

struct HotNoticeView: View {
    
    @Binding var naviPathNoticeView: NavigationPath 
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                Text("인기 게시글 페이지 입니다. :)")
                Button(action: {
                    print("게시판 탭으로 이동합니다.(인기 게시판 - 뒤로가기)")
                    naviPathNoticeView.removeLast()
                }) {
                    ZStack {
                        Rectangle()
                            .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.08)
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .cornerRadius(20)
                        Text("뒤로가기")
                    }
                }
            }
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
