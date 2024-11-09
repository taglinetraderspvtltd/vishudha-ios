//
//  ProductDetails.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 28/05/24.
//

import SwiftUI

struct ProductDetailsView: View {
    let product  : Product
//    @StateObject private var viewModel = ProductDetailsViewModel()
    @State private var isSheetPresented = false
    @State private var quantity: Int = 1
    @State private var selectedQuantity: Int = 1
    @EnvironmentObject var cartViewModel : CartViewModel
    @StateObject private var productDetailsViewModel = ProductDetailsViewModel(bdPrices: BulkDomesticPrices(bulkPrices: [], domesticPrices: []))
    
    var body: some View {
        
        GeometryReader{ geo in
            ScrollView{
                
                // Product Image
                AsyncImage(url: URL(string: product.imageUrl),scale: 3) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1, height: geo.size.height/2, alignment: .center)
                        .shadow(color : .gray, radius: 10)
                        .padding()
                    
                } placeholder: {
                    ProgressView()
                }
                VStack{
                    // Product Name
                    Text(product.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                        .padding(.leading, 10)
                    
                    
                    // Product Description
                    Text(product.description)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Product Brand Name
                    HStack(alignment: .center) {
                        Text("Brand ")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.leading, 5)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(product.brandName)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.leading, 5)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    } .padding(.top, 10)
                    
                    // Sheet for Selecting Bulk or Domestic
                    VStack {
                        Button(action: {
                            isSheetPresented.toggle()
                        }) {
                            Text("Options")
                                .padding()
                                .background(Color.colorGreen)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
//                    .sheet(isPresented: $isSheetPresented) {
//                        BulkDomesticSheetView(bulkDomesticPrices: productDetailsViewModel.bulkDomesticPrices ?? .some(BulkDomesticPrices(bulkPrices: [], domesticPrices:[])))
//                            .presentationDetents([.fraction(0.5)])
//                    }
                }
                
                // Product Price
                HStack(alignment: .center) {
                    Image(systemName: "indianrupeesign")
                        .frame(alignment: .leading)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                    /** PRODUCT PRICE BELOW */
                    /**                         Text(product.brandName)
                     .frame(maxWidth: .infinity, alignment: .center)
                     .padding(.leading, 5)
                     .font(.subheadline)
                     .foregroundColor(.gray)
                     */
                    
                } .padding(.top, 10)
                
                //  MARK : HStack - Qty Selector
                HStack(alignment: .center) {
                    Text("Qty : ")
                        .font(.subheadline)
                        .padding(.top, 5)
                    
                    Picker("Quantity", selection: $selectedQuantity) {
                        ForEach(1..<101) { quantity in
                            Text(" \(quantity)").tag(quantity)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .pickerStyle(MenuPickerStyle())
                    .foregroundColor(.black)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .padding()
                    
                }
                .padding(.horizontal)
                
                // MARK : VStack - Add to Cart & Buy Now Buttons
                VStack {
                    
                    Button(action: {
                        cartViewModel.addToCart(product: product)
                    }) {
                        Label("Add to Cart", systemImage: "cart.badge.plus")
                    }.frame(width: 350, height: 70)
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                        .background(Color.yellow)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                        .padding()
                    // Buy Now Button
                    Button(action: {
                        quantity = 0
                    }) {
                        Text("Buy Now")
                            .frame(width: 350, height: 70)
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .background(Color.orange)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                            .padding()
                    }
                }
            }
            .onAppear{
                productDetailsViewModel.fetchProductsPrices(for: product.id)
            }
        }
    }
}

#Preview {
    ProductDetailsView(product : Products().products[2])
}
