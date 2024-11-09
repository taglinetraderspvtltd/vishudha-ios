//
//  DashboardScreenView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

// Custom ViewModifier to apply font style
struct CustomTabFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)  // Customize the font style here
            .fontWeight(.bold)
            .foregroundColor(.green)
    }
}

extension View {
    func customTabFont() -> some View {
        self.modifier(CustomTabFont())
    }
}

struct DashboardScreenView: View {
    @StateObject private var cartViewModel = CartViewModel()
    @State private var selectedTab = 0
    let dummyCatForPreview = Category(id: "1", name: "Atta", description: "Atta", createdAt: "", updatedAt: "", v: 1)
    
    let dummySubCatForPreview = SubCategory(id: "1", name: "Atta", description: "Atta", imageUrl: "", createdAt: "", updatedAt: "", category: Category(id: "1", name: "Atta", description: "Atta", createdAt: "", updatedAt: "", v: 1) , v: 1)
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                        .customTabFont()
                }
                .tag(0)
            ProfileScreenView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("User")
                }
                .tag(1)
            
            MoreScreenView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("More")
                }
                .tag(2)
            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
                .badge(cartViewModel.cartCount)
                .tag(3)
            
            MenuScreen()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Menu")
                }
                .tag(4)
        }
        .environmentObject(cartViewModel)
    }
}

#Preview {
    DashboardScreenView()
}
