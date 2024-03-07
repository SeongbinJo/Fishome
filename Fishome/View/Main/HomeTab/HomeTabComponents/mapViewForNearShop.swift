//
//  TotalNotice.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct mapViewForNearShop: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()

    var recWidth: CGFloat
    var recHeight: CGFloat

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Rectangle()
                .frame(width: recWidth, height: recHeight)
                .cornerRadius(20)
                .foregroundColor(.white)
                .opacity(0.6)
                .shadow(radius: 5, x: 0, y: 5)
                .overlay {
                    //카카오맵 - 애플 실리콘 맥 환경에서는 시뮬에서 작동하지 않음. 오직 실제기기에서만 가능.
//                    KakaoMapVCWrapper()
                    //애플 맵
                    Map()
                        .cornerRadius(20)
                }
        }
    }
}
