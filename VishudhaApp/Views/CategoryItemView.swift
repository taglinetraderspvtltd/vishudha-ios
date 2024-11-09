//
//  CategoryItemView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct CategoryItemView: View {
    let category: Category
    @StateObject private var viewModel = CategoriesViewModel()
    
    init(category: Category) {
        self.category = category
    }
    
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: SubCategoriesView(category: category)) {
                VStack {
                    // Category Image
                    Image(viewModel.fetchImageName(for: self.category.name ))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 80)
                    Text(category.name)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .frame(width: 100)
                }
                .padding(.vertical)
                .navigationTitle("Categories")
            }
        }
    }
}

