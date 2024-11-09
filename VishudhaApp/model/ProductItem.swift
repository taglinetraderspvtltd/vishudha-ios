//
//  ProductModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 22/05/24.
//

import Foundation

struct  ProductItem : Hashable, Identifiable{
       
        let id = UUID()
        let image: String
        let title: String
        let description: String
        let price: Double
   
}
