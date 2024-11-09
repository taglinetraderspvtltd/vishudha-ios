//
//  CategoriesView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//
import SwiftUI

struct CategoriesView: View {
    
    @StateObject private var viewModel = CategoriesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.categories) { category in
                        NavigationLink(destination: SubCategoriesView(category: category)) {
                            CategoryItemView(category: category)
                        }
                    }
                }.padding(.horizontal)
            }
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoriesView()
}
