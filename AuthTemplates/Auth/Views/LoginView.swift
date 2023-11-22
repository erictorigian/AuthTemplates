//
//  LoginView.swift
//  AuthTemplates
//
//  Created by Eric Torigian on 11/21/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                    
                    CustomInputField(text: $password,
                                     title: "Password",
                                     placeholder: "Enter your password",
                                     isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(12)
                
                
                VStack {
                    //button
                    Button {
                        print("log user in")
                    } label: {
                        HStack {
                            Text("Sign In")
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
                    
                    //forgot passowrd link
                    NavigationLink {
                        ForgotPassword()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Spacer()
                            Text("Forgot Password?")
                                .font(.subheadline)
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                }
                
                Spacer()
                
                //signup link
                
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack {
                        Text("Don't have an account yet?")
                        
                        Text("Sign Up!")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        LoginView()
    }
}
