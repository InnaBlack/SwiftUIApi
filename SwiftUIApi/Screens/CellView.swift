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
    
    @EnvironmentObject var airportViewModel: AirportListViewModel
    @EnvironmentObject var flightViewModel: FlightListViewModel
    @EnvironmentObject var airlineViewModel: AirportListViewModel
    
    let item: Destination = Destination()
    let item1: Flight = Flight()
    let item2: Airline = Airline()

    var body: some View {
        VStack(alignment: .leading) {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
            }
                NavPushButton(destination: WeatherScreen()) {
                    Divider()
                    if let publicName = item.publicName  {
                        Text(verbatim: publicName.english.asStringOrEmpty)
                            .font(.headline)
                            .foregroundColor(.primary)
                        if airportViewModel.isPageLoading && airportViewModel.items.isLast(item) {
                            Divider()
                            VStack (alignment: .center) {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            }
                            .frame(maxWidth: .infinity)
                        }
                }
            }
        } // VStack
    }
}

