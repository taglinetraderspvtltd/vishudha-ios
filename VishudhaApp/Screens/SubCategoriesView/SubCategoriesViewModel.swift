//
//  SubCategoriesViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 31/05/24.
//

import Foundation
import Combine

class SubCategoriesViewModel: ObservableObject {

    @Published var subCategories: [SubCategory] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
        func fetchSubCategories(for categoryId: String) {
            print("Now Exec fetchSubCategories ...\(categoryId)")
            let prepareUrl = "https://taglinetraders.com/api/subcategory/searchByCategory/\(categoryId)"
            print("Prepared URL to Fetch LIst of Subcategories by Category ID : \(prepareUrl)")
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
                        .decode(type: [SubCategory].self, decoder: JSONDecoder())
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .failure(let error):
                                print("Error fetching Sub Categories: \(error)")
                                self.errorMessage = error.localizedDescription
                                self.isLoading = false
                            case .finished:
                                self.isLoading = false
                                break
                            }
                        }, receiveValue: { [weak self] response in
                            print("Response : \(response)")
                            self?.subCategories = response
                            self?.isLoading = false
                        })
                        .store(in: &cancellables)
            print("Sub Categories Results...By Category \(categoryId) are Count : \(subCategories.count) ")
        }
}

