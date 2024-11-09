//
//  CartView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 01/06/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var navigateToPayment = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(cartViewModel.cartItems.keys), id: \.self) { product in
                
                    HStack {
                        // Image
                        AsyncImage(url: URL(string: product.imageUrl),scale: 3) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .shadow(color : .white ,radius: 1)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.subheadline)
                            HStack {
                                Spacer()
                                    Button(action: {
                                        cartViewModel.removeFromCart(product: product)
                                    }) {
                                        Image(systemName: "minus.circle")
                                    }.buttonStyle(BorderlessButtonStyle())
                                    
                                    Text("\(cartViewModel.cartItems[product] ?? 0)")
                                        .padding(.horizontal)
                                    Button(action: {
                                        cartViewModel.addToCart(product: product)
                                    }) {
                                        Image(systemName: "plus.circle")
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                }
//                            Text("$\(product.price, specifier: "%.2f")")
//                                .font(.subheadline)
                        }
//                        Spacer()
                        
                    }
                }
            }
            .navigationTitle("Cart")
            NavigationLink(destination: PaymentView(), isActive: $navigateToPayment) {
                // Buy Now Button
                Button(action: {
                    navigateToPayment = true
                }) {
                    Text("Pay Now")
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
    }
}



#Preview {
    CartView()
}

