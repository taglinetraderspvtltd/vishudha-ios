//
//  CustomStepper.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 19/05/24.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var value : Int
    let range: ClosedRange<Int>

    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                if value > range.lowerBound {
                    value -= 1
                }
            }) {
                Image(systemName: "minus")
                    .font(.body)
                    .foregroundColor(value > range.lowerBound ? .black : .gray)
                    .frame(width: 30, height: 30)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            }
            .disabled(value <= range.lowerBound)
            
            Text("\(value)")
                .font(.body)
                .frame(width: 75)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
                .background(Color(.white))
                .border(.gray)
            
            Button(action: {
                if value < range.upperBound {
                    value += 1
                }
            }) {
                Image(systemName: "plus")
                    .font(.body)
                    .foregroundColor(value < range.upperBound ? .black : .gray)
                    .frame(width: 30, height: 30)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            }
            .disabled(value >= range.upperBound)
        }
        .background(Color(.systemGray5))
        .cornerRadius(15)
       
    }
}


//#Preview {
//    CustomStepper(1, range: 1...100)
//}
