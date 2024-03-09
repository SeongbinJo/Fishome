//
//  NoticeBlock.swift
//  Fishome
//
//  Created by 조성빈 on 3/8/24.
//

import Foundation
import SwiftUI

struct NoticeBlock: View {
    
    @EnvironmentObject var noticeVM: NoticeViewModel

    @Binding var naviPathNoticeView: NavigationPath
    
    var recWidth: CGFloat
    var recHeight: CGFloat
    
    var imageName: String
    var blockTitle: String
    
    var imageWidth: CGFloat
    
    var body: some View {
        NavigationStack(path: $naviPathNoticeView) {
            Button(action: {
                print("게시판 - \(blockTitle) 눌림.")
                naviPathNoticeView.append(blockTitle)
            }) {
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: recWidth, height: recHeight)
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .cornerRadius(20)
                        .shadow(radius: 5, x: 0, y: 5)
                    VStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth)
                        Text(blockTitle)
                    }
                }
            }
            .navigationDestination(for: String.self) { value in
                noticeVM.naviToNotice(value: value, naviPath: $naviPathNoticeView)
            }
        }
    }
}
