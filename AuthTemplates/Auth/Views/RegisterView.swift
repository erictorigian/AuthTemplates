//
//  RegisterView.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email:String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var fullname: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
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
                    
                    CustomInputField(text: $fullname,
                                     title: "Fullname",
                                     placeholder: "Enter your Full Name")
                    
                    CustomInputField(text: $password,
                                     title: "Password",
                                     placeholder: "Enter your password",
                                     isSecureField: true)
                    
                    CustomInputField(text: $confirmPassword,
                                     title: "Confirm Password",
                                     placeholder: "Confirm your password",
                                     isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(12)
                
                
                VStack {
                    //button
                    Button {
                        Task {
                            try await viewModel.createUser(withEmail: email,
                                                           password: password,
                                                           fullname: fullname)
                        }
                    } label: {
                        HStack {
                            Text("Sign Up")
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
                
                //sign-in link
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                        
                        Text("Sign In")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
    }
}


#Preview {
    RegisterView()
}
