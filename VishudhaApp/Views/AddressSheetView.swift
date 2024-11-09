//
//  AddressSheetView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct AddressSheetView: View {
    @Binding var selectedAddress: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    selectedAddress = "Deliver to: 224, Praneeth Pranav Homes, Beeramguda, Ameenpur, Hyderabad.502032"
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("224, Praneeth Pranav Homes, Beeramguda, Ameenpur, Hyderabad.502032")
                }
                Button(action: {
                    selectedAddress = "Deliver to: A Block 301, Rajapushpa Regalia, Kokapet, Hyderabad"
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("A Block 301, Rajapushpa Regalia, Kokapet, Hyderabad")
                }
                Button(action: {
                    selectedAddress = "Deliver to: Address 3"
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Address 3")
                }
            }
            .navigationTitle("Select Address")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

