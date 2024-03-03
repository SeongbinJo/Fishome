//
//  GoogleAuthViewModel.swift
//  Fishome
//
//  Created by 조성빈 on 3/2/24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift


class GoogleAuthViewModel : ObservableObject {
    
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
    
}
