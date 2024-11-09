//
//  CategoriesMainViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 23/05/24.
//

import Foundation

struct CategoriesMainViewModel: Codable {

  var categories : [Categories]? = []
  var page       : Int?          = nil
  var pages      : Int?          = nil

  enum CodingKeys: String, CodingKey {

    case categories = "categories"
    case page       = "page"
    case pages      = "pages"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    categories = try values.decodeIfPresent([Categories].self , forKey: .categories )
    page       = try values.decodeIfPresent(Int.self          , forKey: .page       )
    pages      = try values.decodeIfPresent(Int.self          , forKey: .pages      )
 
  }


}
