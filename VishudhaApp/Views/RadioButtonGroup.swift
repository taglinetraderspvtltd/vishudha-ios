//
//  RadioButtonGroup.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 02/06/24.
//

import SwiftUI

struct RadioButtonGroup: View {

    let items : [String]

    @State var selectedId: String = ""

    let callback: (String) -> ()

    var body: some View {
        VStack {
            ForEach(0..<items.count) { index in
                RadioButton(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId)
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
//
//#Preview {
//    RadioButtonGroup(items: PaymentMethod.allCases, selectedId: PaymentMethod.cod, callback: <#T##(String) -> ()#>)
//}
