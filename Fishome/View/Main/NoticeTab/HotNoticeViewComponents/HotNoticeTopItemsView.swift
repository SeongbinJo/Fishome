//
//  HotNoticeTopItems.swift
//  Fishome
//
//  Created by 조성빈 on 3/9/24.
//

import Foundation
import SwiftUI

struct HotNoticeTopItemsView: View {
    
    @ var HotNoticeStatus: String
    Bindingvar isExpanded: Bool = false
    
    var body: some View {
        Button(action: {}) {
            ZStack {
                Rectangle()
                    .frame(width: 70, height: 40)
                    .foregroundColor(.yellow)
                    .cornerRadius(20)
                Text("뒤로가기")
            }
        }
        HotNoticeDropDownView(HotNoticeStatus: <#T##Binding<String>#>, recWidth: <#T##CGFloat#>, recHeight: <#T##CGFloat#>, imageWidth: <#T##CGFloat#>)
    }
}
