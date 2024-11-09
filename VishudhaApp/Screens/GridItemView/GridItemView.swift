//
//  GridItemView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//
import SwiftUI

struct GridItemView: View {
    let productItem : ProductItem
    
    var body: some View {
        VStack {
            Image(productItem.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width : 140 , height: 140)
            Text(productItem.title)
                .font(.caption)
                .fontWeight(.regular)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        let product = ProductItem(image: "red_chilli", title: "Red Chilli", description: "Vishudha Red Chlli ", price: 12.32)
        GridItemView(productItem: product)
     }
}
