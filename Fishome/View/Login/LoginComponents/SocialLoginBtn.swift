//
//  SocialLoginBtn.swift
//  Fishome
//
//  Created by 조성빈 on 2/28/24.
//

import Foundation
import SwiftUI

struct SocialLoginBtn: View {
    
    @StateObject var kakaoAuthVM = KakaoAuthViewModel()
    
    var buttonImageName: String
    
    var imageSize: CGFloat
    
    var backgroundColor: UIColor
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                //소셜 별 로그인 액션
                switch buttonImageName {
                case "kakao_Logo":
                    print("카카오 로그인 눌림.")
                    kakaoAuthVM.handleKakaoLogin()
                case "google_Logo":
                    print("구글 로그인 눌림.")
                case "apple_Logo_white":
                    print("애플 로그인 눌림.")
                default:
                    print("cannot found social logo.")
                }
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
