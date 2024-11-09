//
//  CategoriesViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 29/05/24.
//

import Foundation
import Combine

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchCategories()
    }
    
    func fetchImageName(for categoryName: String) -> String {
        switch categoryName {
        case "Rice & Cereal":
            print("Returning Rice")
            return "rice"
        case "Atta":
            print("Returning Atta")
            return "atta_flours"
        case "Edible Oils":
            print("Edible Oils")
            return "edible_oils"
        case "Spices & Masalas":
            print("Spices & Masalas")
            return "spices_masalas"
        case "Pulses & Dals":
            print("Pulses & Dals")
            return "dals_pulses"
        case "Tea Sugar/Salt":
            print("Tea Sugar/Salt")
            return "tea"
        case "Vegetables":
            print("vegetables")
            return "vegetables"
        case "Eggs":
            print("Eggs")
            return "eggs"
        default:
            return "rice"
        }
    }
    
    func fetchCategories() {
        print("Now Exec fetchCategories ...")
        guard let url = URL(string: "https://taglinetraders.com/api/category") else { return }
        isLoading = true
        
        URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: Categories.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .failure(let error):
                            print("Error fetching categories: \(error)")
                            self.isLoading = false
                        case .finished:
                            self.isLoading = false
                            break
                        }
                    }, receiveValue: { [weak self] response in
                        self?.categories = response.categories
                        self?.isLoading = false
                    })
                    .store(in: &cancellables)
        print("Categories Results...\(categories) ")
    }
}
