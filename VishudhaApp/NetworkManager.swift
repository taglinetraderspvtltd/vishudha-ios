//
//  NetworkManager.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 22/05/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseUrl = "https://taglinetraders.com/api"
    private let categoriesUrl = baseUrl + "/category"
    
    private init(){
        
    }
    
    func getCategories (completed : (Result<[Category] , APIError>)) -> Void {
        // Define the URL you want to request
//        let /*apiUrlStr*/ = "<https://bugfender.request.url>"
        // Create a URL object from the string
        if let apiUrl = URL(string: categoriesUrl) {
            
            // Create a URLSession instance
            let session = URLSession.shared
            
            // Create a data task using URLSessionDataTask
            let dataTask = session.dataTask(with: apiUrl) { (data, response, error) in
                // Handle the response
                
                // Check for errors
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                // Check if data is available
                guard let responseData = data else {
                    print("No data received")
                    return
                }
                
                // Process the received data
                do {
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        print("Response JSON: \\(json)")
                        if let title = json["name"] as? String {
                            print("Name: \(title)")
                        }
                    }
                } catch {
                    print("Error parsing JSON: \\(error)")
                }
            }
            
            dataTask.resume()
        } else {
            print("URL is not valid!")
        }
    }
}
