//
//  PaymentScreenView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 20/05/24.
//

import SwiftUI

struct PaymentScreenView: View {
    @ObservedObject var paymentViewModel = PaymentViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Select Payment Method")
                    .font(.title2)
                    .bold()
                    .padding(.leading)
                
                ScrollView {
                    ForEach(paymentViewModel.paymentMethods) { method in
                        PaymentMethodRow(
                            paymentMethod: method,
                            isSelected: paymentViewModel.selectedPaymentMethod?.id == method.id
                        )
                        .onTapGesture {
                            paymentViewModel.selectedPaymentMethod = method
                        }
                        .padding(.bottom, 10)
                    }
                }
                
                Spacer()
                
                VStack {
                    TextField("Card Number", text: .constant(""))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal)
                    
                    TextField("Card Holder Name", text: .constant(""))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal)
                    
                    HStack {
                        TextField("MM/YY", text: .constant(""))
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal)
                        
                        TextField("CVV", text: .constant(""))
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .padding(.horizontal)
                    }
                    
                    
                    // Pay Now Navigation to Order Confirmation SCreen
                    NavigationLink(destination: OrderConfirmationView()) {
                        Text("Pay Now")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .fontWeight(.regular)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    }
                    .padding()
                }
                .padding(.bottom, 10)
            }
//            .navigationBarTitle("Payment", displayMode: .inline)
//            .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}


#Preview {
    PaymentScreenView()
}
