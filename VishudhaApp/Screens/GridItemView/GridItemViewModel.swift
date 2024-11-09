//
//  GridItemViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 22/05/24.
//

import SwiftUI

final class GridItemViewModel: ObservableObject {
    @Published var isShowingDetailView : Bool = false

    var selectedItem : ProductItem? {
        didSet{
            isShowingDetailView = true
        }
    }
    
}


