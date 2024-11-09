//
//  OrderRow.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import SwiftUI

struct OrderRow: View {
    var order: Order
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(order.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text(order.productName)
                        .font(.headline)
                    
                    Text("Order Date: \(order.orderDate)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Status: \(order.orderStatus)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "indianrupeesign")
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                        .frame(alignment: .leading)
                    Text(String(format: "%.2f", order.totalPrice))
                        .font(.headline)
                }
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    // Handle track package action
                }) {
                    Text("Track Package")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                
                Spacer()
                
                Button(action: {
                    // Handle view order details action
                }) {
                    Text("View Order Details")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                
                Spacer()
            }
            .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(.horizontal)
    }
}


//#Preview {
////    OrderRow(order: <#T##Order#>(123,"","","",""))
//}
