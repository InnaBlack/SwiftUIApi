//
//  AirportScreenContent.swift
//  SwiftUICombineApp
//
//  Created by  inna on 17/12/2020.
//

import SwiftUI
import UIComponents
import CoreRealm

struct CellView: View {
    
    let item: AdapterItem
    
    var body: some View {
        VStack(alignment: .leading) {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
            }
            Divider()
            Text(verbatim: item.publicName.asStringOrEmpty)
                .font(.headline)
                .foregroundColor(.primary)
        } // VStack
    }
}
