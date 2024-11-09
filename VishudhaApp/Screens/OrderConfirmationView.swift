//
//  OrderConfirmationView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 20/05/24.
//

import SwiftUI

struct OrderConfirmationView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    private func placeOrder() {
        // Implement order placement logic here
//        cartViewModel.clearCart()
        // Navigate to order confirmation screen or show a success message
    }
    init(){
        placeOrder()
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Order Confirmation")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // Order Summary Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Order Summary")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Divider()

                    ForEach(sampleOrderItems, id: \.self) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("Qty: \(item.quantity)")
                            Image(systemName: "indianrupeesign")
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                                .frame(alignment: .leading)
                            Text("\(item.price, specifier: "%.2f")")
                        }
                    }

                    Divider()

                    HStack {
                        Text("Total")
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "indianrupeesign")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                            .frame(alignment: .leading)
                        Text("\(totalOrderPrice(), specifier: "%.2f")")
                            .fontWeight(.bold)
                    }
                }
                .padding()

                // Delivery Details Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Delivery Details")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Divider()
                    Text("Address: A Block 301, Rajapushpa Regalia, Kokapet")
                    Text("Estimated Delivery: May 21, 2024")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(UIColor.systemGroupedBackground))
                .cornerRadius(10)
                .padding()

                // Payment Information Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Payment Information")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Divider()
                    Text("Payment Method: COD")
                    Text("Billing Address: A Block 301, Rajapushpa Regalia, Kokapet")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(UIColor.systemGroupedBackground))
                .cornerRadius(10)
                .padding()

                // Confirmation Message
                VStack(alignment: .center, spacing: 10) {
                    Text("Thank you for your order!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)

                    Text("Your order number is #123456")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(UIColor.systemGroupedBackground))
                .cornerRadius(10)
                .padding()

                Spacer()
            }
            .padding()
        }
//        .navigationTitle("Order Confirmation")
//        .navigationBarTitleDisplayMode(.inline)
    }

    // Sample Data and Functions
    let sampleOrderItems = [
        OrderItem(name: "Item 1", quantity: 1, price: 29.99),
        OrderItem(name: "Item 2", quantity: 2, price: 15.50),
        OrderItem(name: "Item 3", quantity: 1, price: 42.00)
    ]

    struct OrderItem: Hashable {
        let name: String
        let quantity: Int
        let price: Double
    }

    func totalOrderPrice() -> Double {
        return sampleOrderItems.reduce(0) { $0 + $1.price * Double($1.quantity) }
    }
}

struct OrderConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderConfirmationView()
        }
    }
}


#Preview {
    OrderConfirmationView()
}
