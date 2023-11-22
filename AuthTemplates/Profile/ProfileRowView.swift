//
//  ProfileRowView.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import SwiftUI

struct ProfileRowView: View {
    let title: String
    let imageName: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ProfileRowView(title: "Test Row Title",
                   imageName: "gear",
                   tintColor: Color(.systemBlue))
}
