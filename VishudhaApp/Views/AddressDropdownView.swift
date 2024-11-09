//
//  AddressDropdownView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct AddressDropdownView: View {
    @State private var isSheetPresented = false
    @State private var selectedAddress = "Deliver to: Gachibowli"

    var body: some View {
        Button(action: {
            isSheetPresented.toggle()
        }) {
            HStack {
                Text(selectedAddress)
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(10)
        }
        .sheet(isPresented: $isSheetPresented) {
            AddressSheetView(selectedAddress: $selectedAddress)
        }
        .padding(.horizontal)
    }
}

