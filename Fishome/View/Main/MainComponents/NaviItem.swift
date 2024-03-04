//
//  NaviLeadingItem.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI

struct NaviLeadingItem : View {
    
    var eggCount: Int
    
    var body: some View {
        HStack {
                Image("Fishome_Egg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("\(eggCount)")
            Spacer()
            }
        .frame(width: 100)
    }
}


struct NaviTrailingItem : View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "bell.fill")
            Image(systemName: "gearshape.fill")
        }
    }
}
