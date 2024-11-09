//
//  CartViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 01/06/24.
//
import Combine
import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [Product: Int] = [:]
    
    func addToCart(product: Product) {
        print("Exec addToCart cartItems :  \(cartItems)")
        print("Exec addToCart \(product)")
        if let quantity = cartItems[product] {
            print("Quantity of Product \(quantity)")
            cartItems[product] = quantity + 1
        } else {
            print("No Quantity of Product , so Assigning 1")
            cartItems[product] = 1
        }
        print("POST ADDING QUANTITY \(cartItems.count)")
    }
    
    func removeFromCart(product: Product) {
        if let quantity = cartItems[product], quantity > 1 {
            cartItems[product] = quantity - 1
        } else {
            cartItems.removeValue(forKey: product)
        }
        print("POST REMOVING QUANTITY \(cartItems.count)")
    }
    
    var cartCount: Int {
        return cartItems.values.reduce(0, +)
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
    
    var totalAmount: Double {
//        return cartItems.reduce(into: 0) { $0 + ($1.key.price * Double($1.value)) }
        return cartItems.reduce(into: 0) { $0 + (10 * Double($1.value)) }
    }
}
