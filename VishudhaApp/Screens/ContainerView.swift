//
//  ContainerView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented : Bool = false
    
    var body: some View {
        if isSplashScreenViewPresented {
            ContentView()
        }else {
            SplashScreenView(isPresented : $isSplashScreenViewPresented)
        }
    }
}

#Preview {
    ContainerView()
}
