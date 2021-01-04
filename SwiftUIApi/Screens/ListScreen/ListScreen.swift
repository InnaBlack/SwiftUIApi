//
//  ListScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct ListScreen: View {
    
    @EnvironmentObject var airportViewModel: AirpotListViewModel
    @EnvironmentObject var flightViewModel: FlightListViewModel
    @EnvironmentObject var airlineViewModel: AirlineListViewModel
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ListView(viewModel: airportViewModel, sectionName: "Airport", geometry: geometry)
                        ListView(viewModel: flightViewModel, sectionName: "Flights", geometry: geometry)
                        ListView(viewModel: airlineViewModel, sectionName: "Airlines", geometry: geometry)
                    }
                }
            }
        }.onAppear(){
            airportViewModel.loadPage()
            flightViewModel.loadPage()
            airlineViewModel.loadPage()
        }
    }
}
