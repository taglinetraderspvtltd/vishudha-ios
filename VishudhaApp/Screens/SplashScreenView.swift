//
//  SplashScreenView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    @Binding var isPresented : Bool
    let delay: Double = 2.0
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .white, bottomColor: Color.colorGreen)
            
            VStack (spacing:8){
                // mark : - Header
                Spacer()
                // mark : - Center
                ZStack{
                    VStack(spacing : 0){
                        Image(.noBgLogo)
                            .resizable()
                            .frame(width: 160,height: 160)
                            .scaledToFit()
                    }
                }
                Spacer()
                
                VStack(spacing : 0){
                    Image(.vishudhaMaroonTitle)
                        .resizable()
                        .frame(width: 200,height: 60)
                        .scaledToFit()
                }//End of VStack
                Spacer()
            }//End of VStack
        }//End of ZStack
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation {
                    self.isPresented = true
                }
            }
        }
    }//End of body
}

#Preview {
    SplashScreenView(isPresented : .constant(true))
}

struct BackgroundView: View {
    var topColor : Color
    var bottomColor : Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all ,edges: .all )
    }
}
