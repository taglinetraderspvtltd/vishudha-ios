//
//  BulkDomesticPrices.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 04/06/24.
//

import Foundation

import Foundation

// MARK: - BulkDomesticPrices
struct BulkDomesticPrices: Codable {
    var bulkPrices : [Price]
    var domesticPrices : [Price]
    
    enum CodingKeys: String, CodingKey {
        case bulkPrices
        case domesticPrices
    }
    
    //    init(bulkPrices: [Price], domesticPrices: [Price]) {
    //        self.bulkPrices = bulkPrices
    //        self.domesticPrices = domesticPrices
    //    }
}


