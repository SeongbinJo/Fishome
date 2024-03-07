//
//  BottomTabbarViewModel.swift
//  Fishome
//
//  Created by 조성빈 on 3/6/24.
//

import Foundation
import SwiftUI

class BottomTabbarViewModel: ObservableObject {
    
    func viewByTabbarStatus(status: String) -> some View {
        switch status {
        case "게시판":
            return AnyView(NoticeView())
        case "장터":
            return AnyView(HomeView())
        case "홈":
            return AnyView(HomeView())
        case "쪽지":
            return AnyView(HomeView())
        case "프로필":
            return AnyView(HomeView())
        default:
            return AnyView(HomeView())
        }
    }
    
}
