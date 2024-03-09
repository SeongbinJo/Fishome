//
//  HotNoticeBoard.swift
//  Fishome
//
//  Created by 조성빈 on 3/9/24.
//

import Foundation
import SwiftUI

struct HotNoticeDropDownView: View {
    
    @Binding var HotNoticeStatus: String
    
    @State var isExpanded: Bool = false
    
    var noticeTitle: [String : String] = ["자유" : "Fishome_FreeBoardIcon", "해수어" : "Fishome_Whale", "열대어" : "Fishome_Carp"]
    
    
    var recWidth: CGFloat
    var recheight: CGFloat
    
    var imageWidth: CGFloat
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(width: recWidth, height: recheight)
                .foregroundColor(.brown)
            VStack {
                HStack {
                    Image(noticeTitle[HotNoticeStatus]!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imageWidth)
                    Text(HotNoticeStatus)
                    Image(systemName: "chevron.down")
                }
                .frame(minHeight: imageWidth)
                .background(.green)
                if self.isExpanded {
                    HStack {
                        DropDownComponents(HotNoticeStatus: $HotNoticeStatus, isExpanded: $isExpanded, recWidth: recWidth * 0.3, noticeImage: noticeTitle["자유"]!, noticeTitle: "자유", imageWidth: imageWidth)
                        DropDownComponents(HotNoticeStatus: $HotNoticeStatus, isExpanded: $isExpanded, recWidth: recWidth * 0.3, noticeImage: noticeTitle["해수어"]!, noticeTitle: "해수어", imageWidth: imageWidth)
                        DropDownComponents(HotNoticeStatus: $HotNoticeStatus, isExpanded: $isExpanded, recWidth: recWidth * 0.3, noticeImage: noticeTitle["열대어"]!, noticeTitle: "열대어", imageWidth: imageWidth)
                    }
                }
            }
        }
        .onTapGesture {
            withAnimation() {
                isExpanded.toggle()
            }
        }
    }
}

struct DropDownComponents: View {
    
    @Binding var HotNoticeStatus: String
    @Binding var isExpanded: Bool
    
    var recWidth: CGFloat
    
    var noticeImage: String
    
    var noticeTitle: String
    
    var imageWidth: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: recWidth)
                .foregroundColor(.white)
                .cornerRadius(20)
            HStack {
                Image(noticeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth)
                Text(noticeTitle)
            }
            .padding(5)
        }
        .shadow(radius: 5, x: 0, y: 5)
        .onTapGesture {
            self.HotNoticeStatus = noticeTitle
            self.isExpanded.toggle()
        }
    }
}
