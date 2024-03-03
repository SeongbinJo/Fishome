//
//  AppleAuthViewModel.swift
//  Fishome
//
//  Created by 조성빈 on 3/3/24.
//

import Foundation
import AuthenticationServices

class AppleAuthViewModel : ObservableObject {
    
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

    
}
