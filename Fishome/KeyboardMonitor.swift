//
//  KeyboardMonitor.swift
//  Fishome
//
//  Created by 조성빈 on 2/29/24.
//

import Foundation
import Combine
import UIKit

class KeyboardMonitor: ObservableObject {
    
    enum Status {
        case show
        case hide
        var description: String {
            switch self {
            case .show: return "보임"
            case .hide: return "안 보임"
            }
        }
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var updatedKeyboardStatusAction: Status = .hide
    
    @Published var keyboardHeight: CGFloat = 0.0
    
    init() {
        print("키보드가 올라왔다.")
        
        //키보드가 올라올 때
        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
            .sink { (noti : Notification) in
                self.updatedKeyboardStatusAction = .show
                self.keyboardHeight = 0.0
            }.store(in: &subscriptions)
        
        //키보드가 내려갈 때
        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
            .sink { (noti : Notification) in
                self.updatedKeyboardStatusAction = .hide
            }.store(in: &subscriptions)
        
        //키보드 크기 변경될 때
        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardDidChangeFrameNotification)
            .sink { (noti : Notification) in
                let keyboardFrame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                self.keyboardHeight = keyboardFrame.height
            }.store(in: &subscriptions)
    }
}
