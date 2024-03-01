//
//  LocalLoginComponents.swift
//  Fishome
//
//  Created by 조성빈 on 2/28/24.
//

import Foundation
import SwiftUI

struct GeneralTF: View {
    
    @Binding var textTF: String
    
    var hint: String
    
    var strokeColor: UIColor
    
    var body: some View {
        GeometryReader { geometry in
            TextField(hint, text: $textTF)
                .padding()
                .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(strokeColor), lineWidth: 2)
                )
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        }
    }
}
