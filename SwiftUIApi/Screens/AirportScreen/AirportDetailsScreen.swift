//
//  AirportDetailsScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct AirportDetailsScreen: View {
    
    let airportName: String
    let city: String
    let county: String
    let iata: String

    var body: some View {
        
        VStack {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
            }
            Text(airportName).font(Font.system(size: 23))
            Divider()
            HStack(alignment: .center, spacing: 20) {
                Text("")
                Text("")
            }
        }
    }
}
