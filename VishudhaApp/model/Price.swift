//
//  Price.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 04/06/24.
//

import Foundation


// MARK: - Price
struct Price: Codable {
    let id : String
    let unitOfMessure, inKgs, createdAt, updatedAt : String
    let mrp, discountStartsFrom : Int
    let unitPrice, discountPercent , cgst, sgst, igst, tcs : Double
    let product: ProductPriceDetails
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case unitOfMessure, inKgs, createdAt, updatedAt
        case unitPrice , discountPercent , cgst, sgst, igst, tcs
        case mrp, discountStartsFrom
        case product
        case v = "__v"
    }
    
    var identifier: String {
            return UUID().uuidString
        }
    
    static func == (lhs: Price, rhs: Price) -> Bool {
        return lhs.id == rhs.id
    }
}
