//
//  NoInternetView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 20/05/24.
//

import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack {
            Image("no_internet")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            Text("No Internet Connection")
                .font(.title)
                .padding(.top, 10)
            
            Text("Please check your internet connection and try again.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
    }
}


#Preview {
    NoInternetView()
}
