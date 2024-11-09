//
//  SearchBarView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//
import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            // Background for the search bar
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray5))
                .frame(height: 40)
            
            HStack {
                // TextField for entering search text
                TextField("Search", text: $searchText)
                    .padding(.leading, 10)
                
                Spacer()
                
                // Search icon
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal)
    }
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
