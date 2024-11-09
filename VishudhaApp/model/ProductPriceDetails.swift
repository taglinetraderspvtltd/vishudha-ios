//
//  ProductDetails.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 05/06/24.
//

import Foundation


// MARK: - ProductDetails

struct ProductPriceDetails: Hashable,Identifiable, Codable {
    
    var identifier: String {
            return UUID().uuidString
        }
    
    static func == (lhs: ProductPriceDetails, rhs: ProductPriceDetails) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id , user, name, description, imageUrl, hsnCode, brandName , variety , itemFrom, netQuantity, dietType, expiryDate , manufactured , createdAt, updatedAt , subCategory : String
    let isBestSeller: Bool
    let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, user , description , imageUrl , hsnCode , brandName , variety , itemFrom, subCategory
        case netQuantity , dietType , expiryDate , manufactured , createdAt , updatedAt
        case isBestSeller
        case v = "__v"
    }
    
}
