//
//  CategoryViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 23/05/24.
//

import SwiftUI
import Combine

class CategoryViewModel: ObservableObject {

    @Published var items: [CategoriesMainViewModel] = []
        private var cancellables = Set<AnyCancellable>()

    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        guard let url = URL(string: "https://taglinetraders.com/api/category") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CategoriesMainViewModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching items: \(error)")
                }
            }, receiveValue: { items in
                print(items)

            })
            .store(in: &cancellables)
    }
}

