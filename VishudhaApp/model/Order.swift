//
//  Order.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import SwiftUI

struct Order: Identifiable {
    var id = UUID()
    var productImage: String
    var productName: String
    var orderDate: String
    var orderStatus: String
    var totalPrice: Double
}



