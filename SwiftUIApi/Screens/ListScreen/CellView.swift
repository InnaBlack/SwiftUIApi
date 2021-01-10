//
//  AirportScreenContent.swift
//  SwiftUICombineApp
//
//  Created by  inna on 17/12/2020.
//

import SwiftUI
import Networking
import UIComponents

struct CellView<T: ListViewModel>: View {
    
    let item: AdapterItem
    let viewModel: T
    
    var body: some View {
        VStack(alignment: .leading) {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
            }
            switch viewModel {
            case is AirpotListViewModel :
                WeatherScreen().environmentObject(WeatherListViewModel(location: item.publicName.asStringOrEmpty))
            case is WeatherListViewModel :
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
