//
//  APIError.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 22/05/24.
//

import Foundation


enum APIError :Error {
    
    case invalidUrl
    case invalidResponse
    case invalidRequest
    case invalidData
    case unableToProcessRequest
    
}
