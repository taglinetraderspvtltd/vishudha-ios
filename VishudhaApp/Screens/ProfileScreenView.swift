//
//  ProfileScreenView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import SwiftUI

struct ProfileScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    NavigationLink(destination: OrdersListView()) {
                        Text("Your Orders")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 125)
                            )
                    }
                    .padding(.trailing, 5)
                    NavigationLink(destination: OrdersListView()) {
                        Text("Buy Again")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 125)
                            )
                    }
                    .padding(.leading, 5)
                }
                HStack{
                    NavigationLink(destination: OrdersListView()) {
                        Text("Your Account")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 125)
                            )
                    }
                    .padding(1)
                    NavigationLink(destination: OrdersListView()) {
                        Text("Your Lists")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 125)
                            )
                    }
                    .padding(1)
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

#Preview {
    ProfileScreenView()
}
