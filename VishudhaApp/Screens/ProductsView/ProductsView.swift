//
//  ProductsListView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 25/05/24.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var viewModel = ProductsViewModel()
    @State private var productsBySubCategory : [Product] = []
    @State var searchText = ""
    @State var sortByAlphabetical : Bool = false
    @State var isShowingDetailView : Bool = false
    
    let subCategory  : SubCategory
   
    
    let testSubCategory : SubCategory =
        SubCategory(id: "650d7fa6145bc2a93af55cec", name: "Besan", description: "Besan",
                    imageUrl: "https://vtt-sub-categories.s3.amazonaws.com/subcatimages/at_be.jpg",
                    createdAt: "", updatedAt: "",
                    category: Category(id:"650d7fa6145bc2a93af55cec", name:"Atta", description: "Atta",
                                       createdAt: "", updatedAt: "",v:1), v: 1)
    
    
//    var filteredProducts: [Product] {
//        viewModel.products.sort(by : sortByAlphabetical)
//        return viewModel.products.search(for: searchText)
//    }
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.products) { product in
                NavigationLink {
                    ProductDetailsView(product: product)
                } label: {
                    ProductsListItemView(product: product)
                }
            }
            .navigationTitle("Products")
            .searchable(text:$searchText)
            .autocorrectionDisabled()
            .animation(.default,value: searchText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation{
                            sortByAlphabetical.toggle()
                        }
                    }label :{
                        Image(systemName: sortByAlphabetical ? "film" : "textformat" )
                            .symbolEffect(.bounce, value: sortByAlphabetical)
                        }
                }
            }
            .navigationTitle(subCategory.name)
            .onAppear{
                viewModel.fetchProducts(for: subCategory.id)
            }
        }
    }
}
//
//#Preview {
//    ProductsView(subCategory: testSubCategory , searchText: "", isShowingDetailView: .constant(.false),sortByAlphabetical: .constant(.false))
//}
