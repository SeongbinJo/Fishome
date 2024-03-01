//
//  FishomeApp.swift
//  Fishome
//
//  Created by 조성빈 on 2/26/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

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
            ContentView().onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
