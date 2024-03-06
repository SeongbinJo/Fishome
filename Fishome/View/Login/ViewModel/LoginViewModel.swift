//
//  LoginViewModel.swift
//  Fishome
//
//  Created by 조성빈 on 2/28/24.
//

import Foundation
import Combine
import KakaoSDKUser
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

class LoginViewModel: ObservableObject {
    
    //소셜 별 로그인 액션############################################
    @MainActor func actionBySocialLogin(status: String) {
        switch status {
        case "kakao_Logo":
            kakaoLogin()
            print("카카오 로그인 눌림.")
        case "google_Logo":
            googleLogin()
            print("구글 로그인 눌림.")
        case "apple_Logo_white":
            //애플 로그인은 애플에서 제공하는 버튼을 사용함으로 실행함수 X.
            print("애플 로그인 눌림.")
        default:
            print("소셜 로그인 XXXXX.")
        }
    }
    //소셜 별 로그인 액션############################################
    
    
    
    
    //로컬 로그인 관련##############################################
    //LoginView의 텍스트필드
    @Published var localEmail: String = ""
    @Published var localPassword: String = ""
    
    //SignUpView의 텍스트필드
    @Published var signUpEmail: String = ""
    @Published var signUpPassword: String = ""
    @Published var signUpPasswordCheck: String = ""
    @Published var signUpNickname: String = ""
    //로컬 로그인 관련##############################################
    
    
    
    
    //카카오 로그인 관련##############################################
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
    func kakaoLogin() {
        Task {
            // 카카오톡 실행 가능 여부(설치 여부) 확인
            //설치 되어있을 경우.
            if (UserApi.isKakaoTalkLoginAvailable()) {
                //카카오 앱으로 로그인
                isLoggedIn = await handleWithKakaoApp()
                print("카카오 로그인 상태 : ", isLoggedIn)
                UserApi.shared.me { user, error in
                    print("로그인된 카카오 계정 정보 : ", user?.kakaoAccount?.name, user?.kakaoAccount?.email)
                }
                
            }
            //설치 안 되어있을 경우.
            else {
                //카카오 웹뷰로 로그인
                isLoggedIn = await handleWithKakaoWebAccount()
                print("카카오 로그인 상태 : ", isLoggedIn)
                UserApi.shared.me { user, error in
                    print("로그인된 카카오 계정 정보 : ", user?.kakaoAccount?.name, user?.kakaoAccount?.email)
                }
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
    //카카오 로그인 관련##############################################
    
    
    
    
    //구글 로그인 관련##############################################
    //구글 로그인
    func googleLogin() {
        guard let rootVC = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
        GIDSignIn.sharedInstance.signIn(withPresenting: rootVC) { signInResult, error in
            guard let result = signInResult else {
                //로그인 에러.
                return
            }
            //로그인 성공.
            print("구글 로그인 성공. :  ", signInResult)
            print("로그인된 구글 계정 정보 : ", result.user.profile?.email, result.user.profile?.name)
        }
    }

    
    //구글 로그아웃
    func googleLogout() {
        GIDSignIn.sharedInstance.signOut()
        print("구글 계정 로구아웃 완료.")
    }
    //구글 로그인 관련##############################################
    
    
    
    
    //애플 로그인 관련##############################################
    func requestAppleLogin(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.email, .fullName]
    }
    
    func completionAppleLogin(_ authResult: Result<ASAuthorization, Error>) {
        switch authResult {
            case .success(let authorization):
                // 로그인 성공 시의 처리를 작성합니다.
                // ASAuthorization 객체에서 사용자 정보를 추출할 수 있습니다.
                if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                    // 사용자의 이메일과 이름 정보를 가져옵니다.
                    // 실제 앱에서는 여기서 사용자 정보를 저장하거나 사용자 세션을 관리하는 코드를 추가할 수 있습니다.
                    let userEmail = appleIDCredential.email ?? "Not Found Email"
                    let userFullName = appleIDCredential.fullName?.givenName ?? "Not Found Name"
                    // 사용자 정보를 활용하는 로직을 구현합니다.
                    // 예: 사용자 정보를 화면에 표시하거나, 서버에 사용자 정보를 등록합니다.
                    print("애플 로그인 성공. 계정 정보 : \(userEmail) \(userFullName)")
                }
            case .failure(let error):
                // 로그인 실패 시의 처리를 작성합니다.
                // 예: 에러 메시지를 사용자에게 표시합니다.
                print("Authentication error: \(error.localizedDescription)")
            }
    }
    //애플 로그인 관련##############################################
}

