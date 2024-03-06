//
//  SocialLoginBtn.swift
//  Fishome
//
//  Created by 조성빈 on 2/28/24.
//

import Foundation
import SwiftUI

struct SocialLoginBtn: View {
    
    @EnvironmentObject var loginVM: LoginViewModel
    
    var buttonImageName: String
    
    var imageSize: CGFloat
    
    var backgroundColor: UIColor
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                //소셜 별 로그인 액션
                loginVM.actionBySocialLogin(status: buttonImageName)
            }){
                Circle()
                .overlay(
                    Image(buttonImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imageSize)
                )
            }
            .frame(width: geometry.size.width * 0.7)
            .foregroundColor(Color(backgroundColor))
            .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        }
    }
}
