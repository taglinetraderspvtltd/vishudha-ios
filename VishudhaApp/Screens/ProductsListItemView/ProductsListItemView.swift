//
//  ProductsListItemView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 25/05/24.
//

import SwiftUI

struct ProductsListItemView: View {

    @State var product : Product
    
    var body: some View {
        HStack{
            // Image
            AsyncImage(url: URL(string: product.imageUrl),scale: 3) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .shadow(color : .white ,radius: 1)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            VStack{
                //Product Name
                Text(product.name )
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                //Product Brand
                Text(product.brandName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
            }
        }
    }
}

//#Preview {
//    let someproduct = Product(id : "652fb04149e6ae99f0e8cfca",
//                          user: "608cba1e3641497ee41153c9",
//                          name:"AASHIRVAAD SALT  1KG POUCH",
//                          description:"AASHIRVAAD SALT  1KG POUCH",
//                          subCategory:"650d7b35145bc2a93af55c67",
//                          imageUrl : "dummyImageURL",
//                          isBestSeller:false,
//                          hsnCode:"25010010",
//                          brandName: "AASHIRVAAD",
//                          variety:"SALT",
//                          itemFrom:"SALT",
//                          netQuantity:"1PC",
//                          dietType:"Vegetarian",
//                          expiryDate: "9 MONTHS FROM DATE OF MFG",
//                          manufactured: "01-10-2023",
//                          createdAt:"2023-10-18T10:15:29.210Z",
//                          updatedAt : "2023-10-18T10:15:29.210Z",
//                          v: 0)
    
//    ProductsListItemView(product: .constant({}))
//}
