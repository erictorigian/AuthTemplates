//
//  ContentView.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
