//
//  AirportScreenContent.swift
//  SwiftUICombineApp
//
//  Created by  inna on 17/12/2020.
//

import SwiftUI
import Networking
import UIComponents

struct CellView: View {
    
    let item: AdapterItem
    
    var body: some View {
        VStack(alignment: .leading) {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
            }
            switch item.item {
            case is Destination :
                WeatherScreen().environmentObject(WeatherListViewModel(location: item.publicName.asStringOrEmpty))
            case is Weather :
                let ietemWeather = item.item as! Weather
                WeatherDetailScreen(item: ietemWeather)
                Spacer()
            default:
                Divider()
                Text(verbatim: item.publicName.asStringOrEmpty)
                    .font(.headline)
                    .foregroundColor(.primary)
            } // VStack
        }
    }
}
