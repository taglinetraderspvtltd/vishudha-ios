//
//  SubCategoriesView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 24/05/24.
//

import SwiftUI

struct SubCategoriesView: View {
    let category  : Category
    @StateObject private var viewModel = SubCategoriesViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            
            ScrollView {
                
                VStack {
                    if viewModel.isLoading{
                        ProgressView("Loading...")
                    }else if let errorMessage = viewModel.errorMessage {
                        Text("Error : \(errorMessage)")
                    }else{
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.subCategories) { subCategory in
                                NavigationLink(destination: ProductsView(subCategory: subCategory)) {
                                    SubCategoriesGridItemView(subCategory : subCategory)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(category.name)
            .onAppear{
                viewModel.fetchSubCategories(for: category.id)
            }
        }
    }
}

//#Preview {
//    SubCategoriesView(category: Category(id: "1", name: "Atta", description: "Atta", createdAt: "", updatedAt: "", v: 1))
//}
