//
//  ProductsViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 31/05/24.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
        
        func fetchProducts(for subCategoryId: String) {
            print("Now Exec fetchProducts ... \(subCategoryId) ")
            let prepareUrl = "https://taglinetraders.com/api/product/searchBySubCategory/\(subCategoryId)"
            print("test url : \(prepareUrl)")
            guard let url = URL(string: prepareUrl) else {
                errorMessage = "Invalid URL"
                return
            }
            isLoading = true
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map {
                    print("$0.data \($0.data)")
                    print("$0 \($0)")
                    return $0.data
                }
                        .decode(type: [Product].self, decoder: JSONDecoder())
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .failure(let error):
                                print("Error fetching Products : \(error)")
                                self.errorMessage = error.localizedDescription
                                self.isLoading = false
                            case .finished:
                                self.isLoading = false
                                break
                            }
                        }, receiveValue: { [weak self] response in
                            print("Response : \(response)")
                            self?.products = response
                            self?.isLoading = false
                        })
                        .store(in: &cancellables)
            print("Products Results...By Sub Category \(subCategoryId) are Count : \(products.count) ")
        }
}

