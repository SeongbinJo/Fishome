//
//  FishomeApp.swift
//  Fishome
//
//  Created by 조성빈 on 2/26/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import GoogleSignIn
import KakaoSDKUser


@main
struct FishomeApp: App {
    
    let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? "kakao app key nil"
    
    init() {
            // Kakao SDK 초기화
            KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
            print("카카오 네이비트 앱 키 : ", kakaoAppKey)
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    UserApi.shared.me { user, error in
                        if user != nil {
                            print("카카오톡 계정 로그인 상태 입니다.")
                            print("카카오톡 이메일 : ", user?.kakaoAccount?.email)
                            print("카카오톡 이름 : ", user?.kakaoAccount?.name)
                        }else {
                            print("카카오톡 계정 로그아웃 상태입니다.")
                        }
                    }
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        //유저가 구글 로그인을 한 이력이 있는지 확인.
                        if user != nil {
                            print("구글 계정 로그인 상태입니다.")
                            print("구글 이메일 : ", user?.profile?.email)
                            print("구글 이름 : ", user?.profile?.name)
                        }else {
                            print("구글 계정 로그아웃 상태입니다.")
                        }
                    }
                }
                .onOpenURL(perform: { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    AuthController.handleOpenUrl(url: url)
                }else if GIDSignIn.sharedInstance.handle(url) {
                    
                }
            })
        }
    }
}
