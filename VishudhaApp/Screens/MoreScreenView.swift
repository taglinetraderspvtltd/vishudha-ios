//
//  MoreScreenView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct MoreScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    NavigationLink(destination: OrdersListView()) {
                        Text("Your Orders")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    .padding()
                    NavigationLink(destination: OrdersListView()) {
                        Text("Buy Again")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    .padding()
                }
              
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

#Preview {
    MoreScreenView()
}
