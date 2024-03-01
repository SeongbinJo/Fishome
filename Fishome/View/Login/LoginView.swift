//
//  LoginView.swift
//  Fishome
//
//  Created by 조성빈 on 2/27/24.
//

import Foundation
import SwiftUI

struct LoginView : View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @StateObject var kakaoVM = KakaoAuthViewModel()
    
    @State var loginToSignUpView: Bool = false
    
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $navigationPath) {
                VStack {
                    //삐숌 로고 이미지
                    Image("Fishome_Logo_colored")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.8)
    //                    .background(.red)
                        .padding(.bottom, geometry.size.height * 0.12)
                    
                    //로컬 로그인 컴포넌트
                    VStack(alignment: .trailing, spacing : 0) {
                        
                        GeneralTF(textTF: $loginViewModel.localEmail, hint: "이메일", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                        
                        SecureTF(textTF: $loginViewModel.localPassword, hint: "비밀번호", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                        
                        GeneralBtn(buttonText: "로그인", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                        
                        Button(action : {
                            print("회원가입 버튼 클릭.")
//                            navigationPath.append("SignUp")
                            kakaoVM.kakaoLogout()
                        }){
                            Text("삐숌 회원이 되고싶어요!")
                                .foregroundColor(Color(UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1)))
                        }
                        .padding(.trailing, 10)
//                        .navigationDestination(for: String.self) { value in
//                            switch value {
//                            case "SignUp":
//                                SignUpView(navigationPath: $navigationPath)
//                            default:
//                                LoginView()
//                            }}
                    }
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.27)
                    .padding(.bottom, geometry.size.height * 0.02)
                    
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: geometry.size.width * 0.55, height: 0.8)
                    
                    HStack {
                        SocialLoginBtn(buttonImageName: "kakao_Logo", imageSize: geometry.size.width * 0.14, backgroundColor: UIColor(red: 254/255, green: 228/255, blue: 8/255, alpha: 1))
                        SocialLoginBtn(buttonImageName: "google_Logo", imageSize: geometry.size.width * 0.1, backgroundColor: UIColor(red: 243/255, green: 242/255, blue: 243/255, alpha: 1))
                        SocialLoginBtn(buttonImageName: "apple_Logo_white", imageSize: geometry.size.width * 0.1, backgroundColor: UIColor(red: 1/255, green: 0/255, blue: 0/255, alpha: 1))
                    }
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.1)
                    .padding(.top, geometry.size.height * 0.02)
                }
                .position(x: geometry.frame(in: .local).midX, y: geometry.size.height * 0.5)
            }
        }
    }
}
