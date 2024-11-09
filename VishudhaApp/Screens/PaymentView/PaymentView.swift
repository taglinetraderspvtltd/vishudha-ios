//
//  PaymentView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 01/06/24.
//

import SwiftUI

struct PaymentView: View {
    //    @ObservedObject var paymentViewModel = PaymentViewModel()
    
    @State private var selectedPaymentMethod: PaymentMethod = .cod
    @State private var upiReferenceNumber: String = ""
    @State private var shouldTransit: Bool = false
    @EnvironmentObject var cartViewModel: CartViewModel
    
    enum PaymentMethod: String, CaseIterable, Identifiable {
        case cod = "Cash on Delivery"
        case upi = "UPI Payment"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Select Payment Method")
                    .font(.title2)
                    .bold()
                    .padding(.leading)
                VStack {
                    Picker("Select Payment Method", selection: $selectedPaymentMethod) {
                        ForEach(PaymentMethod.allCases) { method in
                            Text(method.rawValue).tag(method)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    
                    if selectedPaymentMethod == .cod {
                        Text("Amount to be paid: ")
                            .font(.title)
                            .padding()
                    } else if selectedPaymentMethod == .upi {
                        TextField("Enter UPI Reference Number", text: $upiReferenceNumber)
                            .frame(width: .infinity)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .controlSize(.large)
                    }
                    NavigationLink(destination: OrderConfirmationView(), isActive: $shouldTransit) {

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
                                .onTapGesture {
                                    self.shouldTransit = true
                                    placeOrder()
                                }
                    }
                    .padding()
                }
                .navigationTitle("Payment")
            }
        }
    }
    private func placeOrder() {
        // Implement order placement logic here
        cartViewModel.clearCart()
        // Navigate to order confirmation screen or show a success message
    }
}



#Preview {
    PaymentView()
}
