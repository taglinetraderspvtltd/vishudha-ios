//
//  ProductsSubCategory.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 03/06/24.
//

import Foundation

// MARK: - ProductsSubCategory
struct ProductsSubCategory: Hashable , Identifiable, Codable {
    let id, name, description: String
    let imageUrl: String
    let createdAt, updatedAt: String
    let category : String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description , imageUrl , createdAt, updatedAt, category
        case v = "__v"
    }
    var identifier: String {
            return UUID().uuidString
        }
    
    static func == (lhs: ProductsSubCategory, rhs: ProductsSubCategory) -> Bool {
        return lhs.id == rhs.id
    }
}


