//
//  KakaoAuthViewModel.swift
//  Fishome
//
//  Created by 조성빈 on 2/29/24.
//

import Foundation
import Combine
import KakaoSDKUser

class KakaoAuthViewModel : ObservableObject {
    
    @Published var isLoggedIn : Bool = false
    
    @MainActor
    func handleWithKakaoApp() async -> Bool {
        
        await withCheckedContinuation() { continuation in
            //카카오톡 앱 통한 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    //로그인 성공 시.
                    print("Kakao Login success.")
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
        
    }
    
    @MainActor
    func handleWithKakaoWebAccount() async -> Bool {
        
        await withCheckedContinuation() { continuation in
            //카카오 웹뷰로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        //do something
                        _ = oauthToken
                        continuation.resume(returning: true)
                    }
                }
        }
    }
    
    @MainActor
    func handleKakaoLogin() {
        Task {
            // 카카오톡 실행 가능 여부(설치 여부) 확인
            //설치 되어있을 경우.
            if (UserApi.isKakaoTalkLoginAvailable()) {
                //카카오 앱으로 로그인
                isLoggedIn = await handleWithKakaoApp()
                print("카카오 로그인 상태 : ", isLoggedIn)
            }
            //설치 안 되어있을 경우.
            else {
                //카카오 웹뷰로 로그인
                isLoggedIn = await handleWithKakaoWebAccount()
                print("카카오 로그인 상태 : ", isLoggedIn)
            }
        }
    }
    
    @MainActor
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                isLoggedIn = false
            }
        }
    }
    
    @MainActor
    func handleKakaoLogout() async -> Bool {
        
        await withCheckedContinuation() { contiuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    contiuation.resume(returning: false)
                }else {
                    print("Kakao Logout Success.")
                    contiuation.resume(returning: true)
                }
            }
        }
        
    }
}
