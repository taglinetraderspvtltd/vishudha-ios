//
//  XDismissButtonView.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 22/05/24.
//

import SwiftUI

struct XDismissButtonView: View {
    @Binding var isShowingDetailView : Bool
    
    var body: some View {
        HStack() {
            Spacer()
            Button{
                isShowingDetailView = false
            }label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.black))
                    .imageScale(.large)
                    .frame(width: 40, height: 40)
            }
        }
    }
}

#Preview {
    XDismissButtonView(isShowingDetailView: .constant(false))
}
