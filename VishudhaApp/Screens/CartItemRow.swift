//
//  CartItemRow.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import SwiftUI

struct CartItemRow: View {
    @ObservedObject var cartViewModel: CartViewModel
    var cartItem: Product
    
    var body: some View {
        //VStack : Main VStack
//        VStack{
//            
//            //HStack : Product Image ,Product Cost Details
//            HStack {
//                Image(cartItem.imageUrl)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height: 50)
//                    .clipShape(Circle())
//                    .padding(.trailing, 10)
//                
//                //VStack : productName
//                VStack(alignment: .leading) {
//                    Text(cartItem.name)
//                        .font(.title)
//                    HStack {
//                        Image(systemName: "indianrupeesign")
//                            .foregroundColor(.black)
//                            .padding(.trailing, 5)
//                            .frame(alignment: .leading)
//                        Text(String(format: "%.2f", 1222.34))
//                            .font(.headline)
//                            .fontWeight(.bold)
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//            .padding()
//            
//            //HStack : Quantity Dec Inc
//            HStack {
//                CustomStepper(value: Binding(
//                    get: { cartItem.quantity },
//                    set: { newValue in
//                        if newValue > cartItem {
//                            cartViewModel.increaseQuantity(for: cartItem)
//                        } else {
//                            cartViewModel.decreaseQuantity(for: cartItem)
//                        }
//                    }
//                ), range: 1...100)
//
//                Button("Delete", action: {
//                    print("Clicked Delete ")
//                })
//                    .background(Color.white)
//                    .foregroundColor(.black)
//                    .buttonStyle(.bordered)
//            }
//        }
        Text ("CartItemRow")
    }
}


//#Preview {
//    CartItemRow(CartViewModel(CartItem(productImage: "product1", productName: "Product 1", productDescription: "Product 1 Description ", productPrice: 29.99, quantity: 1)))
//}
