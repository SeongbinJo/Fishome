//
//  HomeView.swift
//  Fishome
//
//  Created by 조성빈 on 3/5/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    var noticeName: [String] = ["자유", "해수어", "열대어"]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                //알 상태 확인 뷰
                EggStatus(recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.11, imageWidth: geometry.size.width * 0.18)
                    .padding(.top)
                //인기 게시글 뷰
                VStack(alignment: .leading, spacing: 4) {
                    Text("좋아요 TOP 게시글")
                        .padding(.top, 2)
                        .padding(.leading, geometry.size.width * 0.05)
                    TabView {
                        ForEach(noticeName, id: \.self) { name in
                            HotNoticeBoard(noticeName: name, recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.3, titleRecWidth: geometry.size.width * 0.2, titleRecHeight: geometry.size.height * 0.05, noticeWidth: geometry.size.width * 0.8, noticeHeight: geometry.size.height * 0.2)
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.32)
                    .padding(.top, geometry.size.height * -0.01)
                }
                var testShopBlock: [RecentlyShopModel] = [
                    RecentlyShopModel(id: UUID().uuidString, category: "shop", title: "3자 광폭어항 팝니다.", content: "사용감 일절 없음. 두께 8mm, 깨끗~~ 해요. 찔러보기 사절입니다.", price: 30000, image: "person.fill", nickname: "다팔아", greateCount: 5, commentCount: 2, date: Date()),
                    RecentlyShopModel(id: UUID().uuidString, category: "shop", title: "어항 잡동사니 팔아요. 엄청 싸게 내놓음.", content: "해수어항에 필요한 잡동사니들 세트로 올려봅니다. 엄청 깨끗하게 청소해뒀고, 사용감은 조금 있는데 사용하시기엔 문제 없습니다.", price: 50000, image: "house.fill", nickname: "지구끝까지", greateCount: 3, commentCount: 0, date: Date()),
                    RecentlyShopModel(id: UUID().uuidString, category: "shop", title: "어항 잡동사니 팔아요. 엄청 싸게 내놓음.", content: "해수어항에 필요한 잡동사니들 세트로 올려봅니다. 엄청 깨끗하게 청소해뒀고, 사용감은 조금 있는데 사용하시기엔 문제 없습니다.", price: 50000, image: "house.fill", nickname: "지구끝까지", greateCount: 3, commentCount: 0, date: Date()),
                ]
                //장터 최신 글
                VStack(alignment: .center, spacing: 4) {
                    HStack {
                        Text("장터 최신 게시글")
                        Spacer()
                        Button(action: {
                            print("장터 최신 게시글 더보기 클릭")
                        }) {
                            Text("더보기 >")
                                .foregroundColor(.black)
                        }
                    }
                    HStack(alignment: .top) {
                        ForEach(testShopBlock, id: \.id) { block in
                            BlockForRecentlyShopNotice(recWidth: geometry.size.width * 0.28, recHeight: geometry.size.height * 0.2, imagename: block.image, price: block.price, title: block.title)
                                .frame(width: geometry.size.width * 0.28, height: geometry.size.height * 0.3)
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.35)
                //근처 수족관 지도
                VStack(alignment: .leading, spacing: 4) {
                    Text("내 주변 수족관")
                    NoticeComponents(recWidth: geometry.size.width * 0.9, recHeight: geometry.size.height * 0.6)
                        .padding(.bottom, geometry.size.height * 0.1)
                }
            }
            .frame(width: geometry.size.width)
            .background(Color.yellow)
        }
    }
}
