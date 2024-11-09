//
//  DomesticPrices.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 03/06/24.
//

import Foundation

// MARK: - DomesticPrice
struct DomesticPrice: Codable {
    let id, unitOfMessure, inKgs: String
    let unitPrice, mrp, discountStartsFrom, discountPercent: Int
    let cgst, sgst: Double
    let igst, tcs: Int
    let product: Product
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case unitOfMessure, inKgs, unitPrice, mrp, discountStartsFrom, discountPercent, cgst, sgst, igst, tcs, product, createdAt, updatedAt
        case v = "__v"
    }
}
