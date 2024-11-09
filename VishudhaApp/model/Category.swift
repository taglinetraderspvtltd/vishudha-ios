//
//  Category.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 29/05/24.
//

import Foundation

// MARK: - Category
struct Category: Hashable , Identifiable, Codable {
    let id, name, description , createdAt, updatedAt : String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, createdAt, updatedAt
        case v = "__v"
    }
    
    var identifier: String {
            return UUID().uuidString
        }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }
    
}
