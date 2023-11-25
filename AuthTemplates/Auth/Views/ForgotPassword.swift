//
//  ForgotPassword.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        //image
        Image("Logo")
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 120)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding(40)
        
        //input fields
        VStack {
            CustomInputField(text: $email,
                             title: "Email",
                             placeholder: "Enter your email address")
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            
            VStack {
                //send password reset button
                Button {
                    viewModel.sendPasswordReset(email: email)
                } label: {
                    HStack {
                        Text("Reset Password")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,
                           height: 48)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .padding(.top, 24)
                }
            }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .font(.headline)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        ForgotPassword()
    }
}
