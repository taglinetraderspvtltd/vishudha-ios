//
//  ForgotPasswordView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//
import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var loginManager: LoginManager
    @State private var email = ""
    
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
                
                Button(action: {
                    // Handle password reset action
                    // Simulate successful password reset
                    loginManager.isLoggedIn = true
                }) {
                    Text("Reset Password")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
