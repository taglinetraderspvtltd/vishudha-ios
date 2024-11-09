//
//  SignInView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var loginManager: LoginManager
    @State private var email = ""
    @State private var password = ""
    @State private var showingSignUp = false
    @State private var showingForgotPassword = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorGreen")
                    .ignoresSafeArea(.all ,edges: .all )
                VStack(spacing: 20) {
                    VStack(spacing : 0){
                        Image(.noBgLogo)
                            .resizable()
                            .frame(width: 150,height: 150)
                            .scaledToFit()
                    }
                    TextField("Email", text: $email)
                        .frame(width: .infinity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .controlSize(.large)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .controlSize(.regular)
                    
                    Button(action: {
                        // Simulate successful sign-in
                        loginManager.isLoggedIn = true
                    }) {
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        // Handle Google sign-in action
                    }) {
                        HStack {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25,height:25)
                            Text("Sign In with Google")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Button(action: {
                            showingForgotPassword.toggle()
                        }) {
                            Text("Forgot Password?")
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showingSignUp.toggle()
                        }) {
                            Text("Sign Up")
                        }
                    }
                    .padding(.horizontal)
                    .font(.footnote)
                }
//                .navigationBarTitle("Sign In", displayMode: .inline)
                .sheet(isPresented: $showingSignUp) {
                    SignUpView()
                }
                .sheet(isPresented: $showingForgotPassword) {
                    ForgotPasswordView()
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
