//
//  SignUpView.swift
//  Fishome
//
//  Created by 조성빈 on 2/28/24.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var keyboardMonitor = KeyboardMonitor()
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @Binding var navigationPath : NavigationPath
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.lightGray))
                        .opacity(0.2)
                        .cornerRadius(20)
                        .frame(width: geometry.size.width * 0.82, height: geometry.size.height * 0.52)
                    VStack {
                        GeneralTF(textTF: $loginViewModel.signUpEmail, hint: "사용할 이메일을 입력하세요.", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                        GeneralTF(textTF: $loginViewModel.signUpPassword, hint: "사용할 비밀번호 입력하세요.", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                        GeneralTF(textTF: $loginViewModel.signUpPasswordCheck, hint: "비밀번호를 한 번 더 입력해주세요.", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                        GeneralTF(textTF: $loginViewModel.signUpNickname, hint: "사용할 닉네임을 입력하세요.", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                        GeneralBtn(buttonText: "가입하기", strokeColor: UIColor(red: 108/255, green: 160/255, blue: 227/255, alpha: 1))
                    }
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.45)
                }
                .position(x: geometry.frame(in: .local).midX, y: geometry.size.height * 0.5)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(
                    action: {
                        print("SignUp View Back Button Clicked.")
                        navigationPath.removeLast()
                        print(geometry.size.height)
                    }){
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("뒤로가기")
                        }
                    })
            }
        }
//        }
    }
}
