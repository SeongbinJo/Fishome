//
//  HotNoticeContentsView.swift
//  Fishome
//
//  Created by 조성빈 on 3/9/24.
//

import Foundation
import SwiftUI

struct HotNoticeContentsView: View {
    
    var recWidth: CGFloat
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("닉네임")
                        Spacer()
                        Text("24/03/10 14:22")
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("제목이 들어갈 공간입니다.")
                            Text("인기 게시글에 들어갈 내용 - 예시 입니다. 게시글의 내용을 최대한 길게 작성하여 UI 테스트를 하는데 있어서 용이하도록 만드는 예시 입니다. 사랑해요 연예가중개. 인기 게시글에 들어갈 내용 - 예시 입니다. 게시글의 내용을 최대한 길게 작성하여 UI 테스트를 하는데 있어서 용이하도록 만드는 예시 입니다. 사랑해요 연예가중개.")
                        }
                        VStack {
                            Rectangle()
                                .frame(width: 90, height: 90)
                                .foregroundColor(.gray)
                            HStack {
                                Image(systemName: "heart.fill")
                                Text("19")
                                    Image(systemName: "message.fill")
                                    Text("6")
                            }
                        }
                    }
                }
            }
        }
    }
}
