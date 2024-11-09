//
//  CustomYellowButtonView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 22/05/24.
//

import SwiftUI

struct CustomYellowButtonView: View {
    let title : String
    
    var body: some View {
        Text(title)
                .frame(width:350 , height: 50)
                .fontWeight(.regular)
                .background(Color.yellow)
                .foregroundColor(Color(.label))
                .cornerRadius(10)
                .padding()
        }
}

#Preview {
    CustomYellowButtonView(title: "Click Here")
}

