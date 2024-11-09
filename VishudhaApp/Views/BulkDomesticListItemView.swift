//
//  BulkDomesticListView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 03/06/24.
//

import SwiftUI

struct BulkDomesticListItemView : View {
    let imageName: String
    let unitOfMeasure: String
    let unitPrice: String
//    let buttonText: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 100, height: 80)
            Text(unitOfMeasure)
                .font(.subheadline)
                .padding(.leading, 10)
            Text(unitPrice)
                .font(.headline)
                .padding(.leading, 10)
            Spacer()
            Button(action: {
                // Add button action here
                print("Selected \(unitOfMeasure)")
            }) {
                Text("ADD")
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .background(Color.white)
                    .foregroundColor(.colorGreen)
                    .cornerRadius(8)
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(25) /// make the background rounded
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1)
        )
        .background(Color.white)
        .clipped()
                .shadow(radius: 10)
              
               
    }
}


#Preview {
    BulkDomesticListItemView(imageName: "heart", unitOfMeasure: "1 Box", unitPrice: "111.999")
}
