//
//  LocationView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 31/05/24.
//

import SwiftUI

struct LocationView : View {
    @StateObject private var locationManager = LocationManager()
    @State private var address: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Address", text: $address)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .disabled(true) // Disable editing

                Button(action: {
                    locationManager.requestLocation()
                }) {
                    Image(systemName: "location.fill")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            .padding()
            
            Spacer()
        }
        .onReceive(locationManager.$address) { newAddress in
            self.address = newAddress
        }
        .padding()
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

