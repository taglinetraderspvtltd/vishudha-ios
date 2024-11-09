//
//  BulkDomesticSheetView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 03/06/24.
//

import SwiftUI

struct BulkDomesticSheetView: View {
    var bulkDomesticPrices : BulkDomesticPrices
    var body: some View {
        VStack {
            
            // WRITE THE LOGIC TO ITERATE THE RESULTS OF BULK & DOMESTIC PRICES
            
            BulkDomesticListItemView(imageName: "heart", unitOfMeasure: "Item 1", unitPrice: "123")
            BulkDomesticListItemView(imageName: "heart", unitOfMeasure: "Item 2", unitPrice: "333")
            
            Spacer()
        }
        .padding()
    }
}
//
//#Preview {
//    BulkDomesticSheetView(bulkDomesticPrices: BulkDomesticPrices)
//}
