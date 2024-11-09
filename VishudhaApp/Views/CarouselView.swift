//
//  CarouselView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct CarouselView: View {
    var items: [String] 
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
                    ForEach(0..<items.count) { index in
                        Image(items[index])
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .clipped()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 250)
                .onReceive(timer) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % items.count
                    }
                }
    }
}


struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let carouselImages : [String] = ["banner_1", "banner_2", "banner_3","banner_4","banner_5","banner_6","banner_7"]
        CarouselView(items: carouselImages)
    }
}
