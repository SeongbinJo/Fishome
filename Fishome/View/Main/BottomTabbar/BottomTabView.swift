//
//  BottomTabView.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI

struct BottomTabView : View {
    
    @Binding var pageStatus: String
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(.white)
//                .opacity(0.8)
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.08)
                .overlay {
                    HStack {
                        Spacer()
                        TabbarItem(pageStatus: $pageStatus, iconName: "rectangle.and.pencil.and.ellipsis", itemName: "게시판")
                        Spacer()
                        TabbarItem(pageStatus: $pageStatus, iconName: "basket.fill", itemName: "장터")
                        Spacer()
                        TabbarItem(pageStatus: $pageStatus, iconName: "house.fill", itemName: "홈")
                        Spacer()
                        TabbarItem(pageStatus: $pageStatus, iconName: "message.fill", itemName: "쪽지")
                        Spacer()
                        TabbarItem(pageStatus: $pageStatus, iconName: "person.fill", itemName: "프로필")
                        Spacer()
                    }
                }
                .position(x: geometry.frame(in: .local).midX, y: geometry.size.height * 0.96)
        }
    }
    
}
