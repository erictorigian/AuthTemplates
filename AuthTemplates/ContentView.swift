//
//  ContentView.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if Auth.auth().currentUser != nil {
                ProfileView()
            } else {
                LoginView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
