//
//  SignUpView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var loginManager: LoginManager
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
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
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    // Simulate successful sign-up
                    loginManager.isLoggedIn = true
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
            }
        }
//            .navigationBarTitle("Sign Up", displayMode: .inline)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
