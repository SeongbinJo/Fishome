//
//  LoginViewModel.swift
//  Fishome
//
//  Created by 조성빈 on 2/28/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    //LoginView의 텍스트필드
    @Published var localEmail: String = ""
    @Published var localPassword: String = ""
    
    //SignUpView의 텍스트필드
    @Published var signUpEmail: String = ""
    @Published var signUpPassword: String = ""
    @Published var signUpPasswordCheck: String = ""
    @Published var signUpNickname: String = ""
    
}

