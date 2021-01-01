//
//  ListScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct AirportListScreen: View {
    
    @EnvironmentObject var airportViewModel: AirportListViewModel
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            List {
                ForEach(airportViewModel.items) { airport in
                    if let publicName = airport.publicName  {
                        NavPushButton(destination:   AirlineCellView(item: airport)
                                        .onAppear() {
                                            if airportViewModel.items.isLast(airport) {
                                                airportViewModel.loadPage()
                                            }
                                        }) {
                            Text(verbatim:publicName.english.asStringOrEmpty)
                        }
                    }
                } // List
            }
        }.onAppear(){
            airportViewModel.loadPage()
        }
    }
}
