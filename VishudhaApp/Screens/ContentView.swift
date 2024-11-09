//
//  ContentView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 17/05/24.
//

import SwiftUI

struct OnboardingScreen: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(title)
                .font(.title)
                .padding(.bottom, 10)
            
            Text(description)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
        }
        .padding()
    }
}

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    @StateObject var loginManager = LoginManager()
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some View {
        ZStack{
            // NETWORK CHECK - START
            Group {
                if networkMonitor.isConnected {
                    if isOnboardingViewActive {
                        OnboardingView()
                    }else if !loginManager.isLoggedIn {
                        DashboardScreenView()
                    }else {
                        SignInView()
                    }
                } else {
                    NoInternetView()
                }
            }
            .onAppear {
                networkMonitor.objectWillChange.send()
            }
            // NETWORK CHECK - END

        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

