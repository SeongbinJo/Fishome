//
//  TabbarItem.swift
//  Fishome
//
//  Created by 조성빈 on 3/4/24.
//

import Foundation
import SwiftUI

struct TabbarItem : View {
    
    @Binding var pageStatus: String
    
    var iconName: String
    
    var itemName: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.pageStatus = itemName
                print("탭바 (\(self.pageStatus)) 클릭됨")
            }
        }){
            VStack(spacing: 5) {
                Image(systemName: iconName)
                    .font(.system(size: 20))
                Text(itemName)
                    .font(.system(size: 14))
            }
            .foregroundColor(pageStatus == itemName ? .blue : .gray)
        }
    }
}
