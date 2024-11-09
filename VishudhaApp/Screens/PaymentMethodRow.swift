//
//  PaymentMethodRow.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 20/05/24.
//

import SwiftUI

struct PaymentMethodRow: View {

    var isSelected: Bool
    
    var body: some View {
        HStack {
            Text("PaymentMethodRow")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}
