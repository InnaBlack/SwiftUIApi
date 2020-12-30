//
//  AirportScreenContent.swift
//  SwiftUICombineApp
//
//  Created by  inna on 17/12/2020.
//

import SwiftUI
import UIComponents

struct AirportScreenContent: View {
    
    @EnvironmentObject var airportViewModel: ArportListViewModel
    
    var body: some View {
        List() {
            Text(verbatim: "")
//            ForEach(airportViewModel.items) { airoport in
//                NavPushButton(destination: AirportDetailsScreen(airportName: airoport.publishedName, city: airoport.city, county: airoport.country, iata: airoport.iata)) {
//                    Text(verbatim: airoport.publishedName)
//                }
//            }
      } // List
  }
}
