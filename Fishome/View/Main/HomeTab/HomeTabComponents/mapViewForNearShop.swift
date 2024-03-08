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
                    //애플 맵
                    Map()
                        .cornerRadius(20)
                }
        }
    }
}
