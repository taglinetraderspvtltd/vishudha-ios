//
//  SubCategoriesGridItemView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 24/05/24.
//

import SwiftUI

struct SubCategoriesGridItemView: View {
    let subCategory : SubCategory
    
    var body: some View {
        //        NavigationStack{
        VStack {
            
            AsyncImage(url: URL(string: subCategory.imageUrl),scale: 3) { image in
                image.resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 170, height: 170)
            Text(subCategory.name)
                .font(.subheadline)
                .fontWeight(.bold)

        }
        .padding()
    }
}

//#Preview {
//    SubCategoriesGridItemView(subCategory: SubCategory(id:"1", name: "red_chilli", description: "Sunflower Oil", imageUrl: "Sunflower Oil",category: "SOMEID",createdAt: "",updatedAt: "", v: 0))
//}
