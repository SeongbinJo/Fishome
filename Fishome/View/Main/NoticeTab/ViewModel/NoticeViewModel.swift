//
//  NoticeViewModel.swift
//  Fishome
//
//  Created by 조성빈 on 3/8/24.
//

import Foundation
import SwiftUI

class NoticeViewModel: ObservableObject {
    
    enum noticeViewType {
        case HotNoticeView
        case FreeBoardView
    }
    
    //게시판 탭 - UI내 존재하는 모든 게시판을 클릭했을 때의 액션(뷰 이동)
    //Switch의 대상은 DB 연결 후 게시판 종류(detailCategory)를 불러와 사용 -> 관리자가 게시판을 생성 및 삭제할 수 있기 때문.
    func naviToNotice(value: String, naviPath: Binding<NavigationPath>) -> some View {
        switch value {
        case "인기 게시판":
            return AnyView(HotNoticeView(naviPathNoticeView: naviPath))
        case "자유 게시판":
            return AnyView(FreeBoardView(naviPathNoticeView: naviPath))
        default:
            print("뭔가 이상하다..(NoticeViewModel)")
            return AnyView(Text("Error: NoticeViewModel - naviToNotice."))
        }
    }
    
}
