//
//  CategoryView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 23/05/24.

import SwiftUI

struct CategoryViewBkp: View {
    @StateObject private var viewModel = CategoryViewModel()
        
        var body: some View {
            NavigationView {
                Text("CategoryView")
               //                            .font(.headline)
//                List(viewModel.items) { item in
//                    VStack(alignment: .leading) {
//                        Text(item.name)
//                            .font(.headline)
//                        Text(item.description)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    .padding(.vertical, 8)
//                }
                .navigationBarTitle("Items", displayMode: .inline)
            }
        }
}

#Preview {
    CategoryViewBkp()
}
