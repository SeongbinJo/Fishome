//
//  MainView.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var BottomTabbarVM: BottomTabbarViewModel
    
    @State var pageStatus: String = "홈"
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    BottomTabbarVM.viewByTabbarStatus(status: pageStatus)
                    BottomTabView(pageStatus: $pageStatus) // 이 부분은 BottomTabView의 구현에 따라 다릅니다.
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NaviLeadingItem(eggCount: 1200)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NaviTrailingItem()
                    }
                }
            }
        }
    }
}
