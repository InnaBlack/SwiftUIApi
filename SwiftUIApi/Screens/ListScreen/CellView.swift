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
    
    @EnvironmentObject var airportViewModel: AirpotListViewModel
    @EnvironmentObject var flightViewModel: FlightListViewModel
    @EnvironmentObject var airlineViewModel: AirlineListViewModel
    
    let item: AdapterItem

    var body: some View {
        VStack(alignment: .leading) {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
            }
                NavPushButton(destination: WeatherScreen()) {
                    Divider()
                    if let publicName = item.publicName  {
                        Text(verbatim: publicName)
                            .font(.headline)
                            .foregroundColor(.primary)
                }
            }
        } // VStack
    }
}

