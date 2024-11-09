//
//  Products.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 25/05/24.
//

import Foundation


class Products : Decodable{
    var products :[Product] = []
    
    init(){
        decodeProductsData()
    }
    
    func decodeProductsData () -> Void {
        print("Decode Products Data")
        if let url = Bundle.main.url(forResource: "products", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                products = try decoder.decode([Product].self, from: data)
                print("Products decoded are : \(products)")
            }catch{
                print("ERROR DECODING JSON DATA\(error)")
            }
        }
    }
    
    func search (for searchParam : String) -> [Product] {
        if searchParam.isEmpty {
            return products
        }
        else {
            return products.filter{
                product in
                product.name.localizedCaseInsensitiveContains(searchParam)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        return products.sort { product1, product2 in
            if alphabetical {
                return product1.name < product2.name
            }else{
                return product1.id < product2.id
            }
        }
    }
    
    func filterByType (by type : Product){
        // print("Exec filterByType ...! ")
    }
}
