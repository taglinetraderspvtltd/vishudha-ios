//
//  OrdersListView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import SwiftUI

struct OrdersListView: View {
    @ObservedObject var ordersViewModel = OrdersViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(ordersViewModel.orders) { order in
                        OrderRow(order: order)
                            .padding(.bottom, 10)
                    }
                }
                .padding(.top)
            }
            .navigationBarTitle("Your Orders", displayMode: .inline)
            .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}


#Preview {
    OrdersListView()
}
