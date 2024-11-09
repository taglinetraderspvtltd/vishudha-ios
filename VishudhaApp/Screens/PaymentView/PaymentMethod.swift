//
//  PaymentMethod.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 01/06/24.
//

import Foundation

enum PaymentMethod: String, CaseIterable, Identifiable {
    case cod = "cod"
    case upi = "upi"
    case name = "name"
    var id: String { self.rawValue }
}
