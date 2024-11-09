//
//  CartItem.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import SwiftUI

struct CartItem: Identifiable{
    var id = UUID()
    var productImage : String
    var productName : String
    var productDescription : String
    var productPrice : Double
    var quantity : Int
    
    
}
