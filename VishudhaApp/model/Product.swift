//
//  Product.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 25/05/24.
//

import Foundation

// MARK: - Product

struct Product: Hashable,Identifiable, Codable {
    
    var identifier: String {
            return UUID().uuidString
        }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id , user, name, description, imageUrl, hsnCode, brandName , variety , itemFrom, netQuantity, dietType, expiryDate , manufactured , createdAt, updatedAt : String
    let subCategory: ProductsSubCategory
    let isBestSeller: Bool
    let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, user , description , imageUrl , hsnCode , brandName , variety , itemFrom
        case netQuantity , dietType , expiryDate , manufactured , createdAt , updatedAt
        case isBestSeller
        case subCategory
        case v = "__v"
    }
//    init?(jsonString: String) throws {
//        guard let jsonData = jsonString.data(using: .utf8) else { return nil }
//        self = try JSONDecoder().decode(Self.self, from: jsonData)
//    }
    
    
}
