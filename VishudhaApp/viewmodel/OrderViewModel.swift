//
//  OrderViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import Foundation

class OrdersViewModel: ObservableObject {
    @Published var orders: [Order] = [
        Order(productImage: "product1", productName: "Product 1", orderDate: "May 15, 2024", orderStatus: "Delivered", totalPrice: 29.99),
        Order(productImage: "product2", productName: "Product 2", orderDate: "May 12, 2024", orderStatus: "Shipped", totalPrice: 49.99)
    ]
}
