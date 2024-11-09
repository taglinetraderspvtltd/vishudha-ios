//
//  SubCategory.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 24/05/24.
//

import Foundation

// MARK: - SubCategory
struct SubCategory: Hashable , Identifiable, Codable {
    let id, name, description: String
    let imageUrl: String
    let createdAt, updatedAt: String
    let category : Category
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description , imageUrl , createdAt, updatedAt
        case category
        case v = "__v"
    }
    var identifier: String {
            return UUID().uuidString
        }
    
    static func == (lhs: SubCategory, rhs: SubCategory) -> Bool {
        return lhs.id == rhs.id
    }
}
