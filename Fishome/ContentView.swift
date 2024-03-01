//
//  ContentView.swift
//  Fishome
//
//  Created by 조성빈 on 2/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView()
            .environmentObject(LoginViewModel())
    }
}
