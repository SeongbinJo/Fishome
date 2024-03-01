//
//  LoginBtn.swift
//  Fishome
//
//  Created by 조성빈 on 2/28/24.
//

import Foundation
import SwiftUI

struct GeneralBtn: View {
    
    var buttonText: String
    
    var strokeColor: UIColor
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                print("버튼 눌렸다잉")
            }){
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(Color(strokeColor))
                    .overlay(
                        Text(buttonText)
                            .foregroundColor(.white)
                    )
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.8)
            }
                .padding()
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        }
    }
}
