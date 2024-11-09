//
//  ListItemViewModel.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 22/05/24.
//

import SwiftUI

final class ListItemViewModel: ObservableObject {
    @Published var isShowingDetailView : Bool = false

    var selectedItem : ProductItem? {
        didSet{
            isShowingDetailView = true
        }
    }
    
}
