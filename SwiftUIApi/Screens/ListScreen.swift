//
//  ListScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct ListScreen: View {
    
    @EnvironmentObject var airportViewModel: AirportListViewModel
    @EnvironmentObject var flightViewModel: FlightListViewModel
    @EnvironmentObject var airlineViewModel: AirportListViewModel
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            GeometryReader { g in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        List {
                            Section.init {
                                Text("Aiport").bold()
                            }
                            ForEach(airportViewModel.items) { airport in
                                if let publicName = airport.publicName  {
                                    NavPushButton(destination: CellView(item: airport)
                                                    .onAppear() {
                                                        if airportViewModel.items.isLast(airport) {
                                                            airportViewModel.loadPage()
                                                        }
                                                    }) {
                                        Text(verbatim:publicName.english.asStringOrEmpty)
                                    }
                                }
                            }
                        }.frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)//List1
                        List {
                            Section.init {
                                Text("Flights").bold()
                            }
                            ForEach(flightViewModel.items) { flight in
                                if let aircraftRegistration = flight.aircraftRegistration  {
                                    NavPushButton(destination: CellView(item: flight)
                                                    .onAppear() {
                                                        if flightViewModel.items.isLast(flight) {
                                                            flightViewModel.loadPage()
                                                        }
                                                    }) {
                                        Text(verbatim: aircraftRegistration)
                                    }
                                }
                            }
                        }.frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)//List2
                        List {
                            Section.init {
                                Text("Airlines").bold()
                            }
                            ForEach(airlineViewModel.items) { airline in
                                if let publicName = airline.publicName  {
                                    NavPushButton(destination: CellView(item: airline)
                                                    .onAppear() {
                                                        if airlineViewModel.items.isLast(airline) {
                                                            airlineViewModel.loadPage()
                                                        }
                                                    }) {
                                        Text(verbatim: publicName)
                                    }
                                }
                            }
                        }.frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)//List3
                    }
                }
            }
            
            
        }.onAppear(){
            airportViewModel.loadPage()
        }
    }
}
