//
//  ProfileView.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            //user info
            Section {
                HStack {
                    Text(User.MOCK_USER.initals)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(User.MOCK_USER.fullname)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            
            
            Section("General Preferences") {
                HStack {
                    ProfileRowView(title: "Version",
                                   imageName: "gear",
                                   tintColor: .blue)
             
                    Text("1.0")
                        .foregroundColor(.black)
                }
            }
            
            
            Section("Account Settings") {
                Button {
                    print("sign out")
                } label: {
                    ProfileRowView(title: "Sign Out",
                                   imageName: "rectangle.portrait.and.arrow.right",
                                   tintColor: .red)
                }

                Button {
                    print("Delete account")
                } label: {
                    
                    ProfileRowView(title: "Delete Account",
                                   imageName: "xmark.circle.fill",
                                   tintColor: .red)
                }

            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    ProfileView()
}
