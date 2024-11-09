//
//  ProductDetailsViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 03/06/24.
//

import Foundation
import Combine

class ProductDetailsViewModel: ObservableObject {
    @Published var products: [Product] = []
//    @Published var products: [Product] = []
    @Published var bulkDomesticPrices : BulkDomesticPrices?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    init(bdPrices : BulkDomesticPrices) {
//        bulkDomesticPrices.bulkPrices = bdPrices.bulkPrices
//        bulkDomesticPrices.domesticPrices = bdPrices.domesticPrices
        return
    }
    
    private var cancellables = Set<AnyCancellable>()
        
        func fetchProductsPrices(for productId: String) {
            print("Now Exec fetchProductsPrices ... \(productId) ")
            let prepareUrl = "https://taglinetraders.com/api/product/prices/\(productId)"
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
                        .decode(type: BulkDomesticPrices.self, decoder: JSONDecoder())
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .failure(let error):
                                print("Error fetching Product Prices : \(error)")
                                self.errorMessage = error.localizedDescription
                                self.isLoading = false
                            case .finished:
                                self.isLoading = false
                                break
                            }
                        }, receiveValue: { [weak self] response in
                            print("BulkPrices Response : \(response.bulkPrices)")
                            print("DomesticPrices Response : \(response.domesticPrices)")
                            self?.bulkDomesticPrices?.bulkPrices = response.domesticPrices
                            self?.bulkDomesticPrices?.domesticPrices = response.domesticPrices
                            self?.isLoading = false
                        })
                        .store(in: &cancellables)
            print("Products Results...By Sub Category \(productId)  ")
        }
}
