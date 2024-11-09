//
//  HomeView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 17/05/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = false
    
    @StateObject var gridItemViewModel = GridItemViewModel()
    //    @Published var isShowingDetailView : Bool = false
    let carouselImages = ["banner_1", "banner_2", "banner_3","banner_4","banner_5","banner_6","banner_7"]
    let productItems : [ProductItem] = [
        ProductItem(image: "red_chilli", title: "Vishudha Chilli", description: "Vishudha Chilli", price: 123.0),
        ProductItem(image: "turmeric", title: "Vishudha Turmeric", description: "Vishudha Turmeric", price: 100.0),
        ProductItem(image: "coriander", title: "Vishudha Corriander", description: "Vishudha Corriander", price: 123.0),
        ProductItem(image: "gold_drop", title: "Gold Drop", description: "Gold Drop", price: 123.0),
        ProductItem(image: "ruchi_gold", title: "Ruchi Gold", description: "Ruchi Gold", price: 123.0),
        ProductItem(image: "salt", title: "Vishudha Salt", description: "Vishudha Salt", price: 123.0)
        
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                SearchBarView()
                    .padding(2)
                ScrollView {
                    VStack{
                        AddressDropdownView()
                            .padding(.top, 2)
                        
                        LocationView()
                            .padding(.top, 2)
                        
                        CategoriesView()
                            .padding(.top, 2)
                        
                        CarouselView(items: carouselImages)
                        
                        Spacer()
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(productItems) { productItem in
                                    GridItemView(productItem:productItem)
                                        .onTapGesture {
                                            print("CLICKED THE \(productItem)... ROUTING TO DETAILS SCREEN")
                                            gridItemViewModel.selectedItem = productItem
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }.navigationTitle("Home")
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
