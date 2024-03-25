//
//  FreeBoardView.swift
//  Fishome
//
//  Created by 조성빈 on 3/9/24.
//

import Foundation
import SwiftUI

struct FreeBoardView: View {
    
    @Binding var naviPathNoticeView: NavigationPath
    
    @State var HotNoticeStatus = "자유"
    
    var body: some View {
        GeometryReader { geometry in
                    ScrollView {
                        ZStack(alignment: .topLeading) {
                                //인기 게시판 종류 드롭 메뉴 버튼
                                HotNoticeDropDownView(HotNoticeStatus: $HotNoticeStatus, recWidth: geometry.size.width * 0.9, recheight: geometry.size.height * 0.055, imageWidth: geometry.size.width * 0.1)
                                //뒤로가기 버튼
                                Button(action: {
                                    print("게시판 탭으로 이동합니다.(인기 게시판 - 뒤로가기)")
                                    naviPathNoticeView.removeLast()
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.055)
                                            .foregroundColor(.white)
                                            .opacity(0.6)
                                            .cornerRadius(20)
                                        Text("뒤로가기")
                                    }
                                    .background(.blue)
                                }
                            }
                        //자유 게시판 게시글
                        HotNoticeContentsView(recWidth: geometry.size.width * 0.9)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .padding(.vertical)
                            .background(.red)
                        Rectangle()
                            .frame(width: geometry.size.width * 0.9, height: 1)
                        HotNoticeContentsView(recWidth: geometry.size.width * 0.9)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .padding(.vertical)
                            .background(.red)
                        Rectangle()
                            .frame(width: geometry.size.width * 0.9, height: 1)
                        HotNoticeContentsView(recWidth: geometry.size.width * 0.9)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .padding(.vertical)
                            .background(.red)
                        Rectangle()
                            .frame(width: geometry.size.width * 0.9, height: 1)
                        HotNoticeContentsView(recWidth: geometry.size.width * 0.9)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .padding(.vertical)
                            .background(.red)
                        Rectangle()
                            .frame(width: geometry.size.width * 0.9, height: 1)
                        HotNoticeContentsView(recWidth: geometry.size.width * 0.9)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .padding(.vertical)
                            .background(.red)
                        Rectangle()
                            .frame(width: geometry.size.width * 0.9, height: 1)
                        HotNoticeContentsView(recWidth: geometry.size.width * 0.9)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .padding(.vertical)
                            .background(.red)
                        Rectangle()
                            .frame(width: geometry.size.width * 0.9, height: 1)
                    }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(.yellow)
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

    }
}
