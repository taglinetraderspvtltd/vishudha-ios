//
//  CartViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import Foundation

class CartViewModelOld: ObservableObject {
    @Published var cartItems: [CartItem] = [
        CartItem(productImage: "product1", productName: "Product 1", productDescription: "Product 1 Description ", productPrice: 29.99, quantity: 1),
        CartItem(productImage: "product2", productName: "Product 2", productDescription: "Product 2 Description ", productPrice: 49.99, quantity: 2),
        CartItem(productImage: "product3", productName: "Product 3", productDescription: "Product 3 Description ", productPrice: 49.99, quantity: 3)
    ]
    
    var totalAmount: Double {
        cartItems.reduce(0) { $0 + $1.productPrice * Double($1.quantity) }
    }
    
    func increaseQuantity(for item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity += 1
        }
    }
    
    func decreaseQuantity(for item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            }
        }
    }
    
    func removeItem(_ item: CartItem) {
        cartItems.removeAll { $0.id == item.id }
    }
}

