//
//  OnboardingScreen.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 17/05/24.
//

import SwiftUI

struct OnboardingView: View {
    // mark : - property
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    
    // mark : - body
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.colorGreen, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all ,edges: .all )
            VStack (spacing:10){
                // mark : - Header
                Spacer()
                VStack(spacing : 0){
                    Image(.vishudhaMaroonTitle)
                        .resizable()
                        .frame(width: 200,height: 60)
                        .scaledToFit()
                }
                
                // mark : - Center
                ZStack{
                    VStack(spacing : 0){
                        Image(.selectItems)
                            .resizable()
                            .frame(width: 160,height: 160)
                            .scaledToFit()
                        
                    }
                }
                Spacer()
                // mark : - Footer
                ZStack{
                    // 1. background static
                    Capsule()
                        .fill(Color.white)
                        .opacity(0.2)
                    Capsule()
                        .fill(Color.white)
                        .opacity(0.2)
                        .padding(8)
                    // 2. CALL TO ACTION static
                    Text("Get Started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .offset(x:20)
                    // 3. CAPSULE DYNMIC WIDTH
                    HStack{
                        Capsule()
                            .fill(.colorMaroon)
                            .frame(width: 80)
                        Spacer()
                    }
                    // 4. BUTTON DRAGGABLE
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color.colorMaroon)
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                            
                        }.foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .onTapGesture {
                                isOnboardingViewActive = false
                            }
                        Spacer()
                    }
                   
                }
                .frame(height: 80,alignment: .center)
                .padding()
            }
        }//End of VStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
