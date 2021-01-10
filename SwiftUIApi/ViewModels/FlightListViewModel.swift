//
//  FlightsListViewModels.swift
//  SwiftUIApi
//
//  Created by  inna on 02/01/2021.
//

import SwiftUI
import Networking

extension Flight: Identifiable {
    public var id: String {
        aircraftRegistration ?? "id"
    }
}

final class FlightListViewModel: ListViewModel, ObservableObject {
    
   
    @Published var items: [AdapterItem] = [AdapterItem]()
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false
    public var id = UUID()
    
    init() {}
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
      
        FlightAPI.getFlights(accept: "application/json", appId: "d51e7d9d", appKey: "7b2e061cde3bcbaa8831e4fb8bb777d6", resourceVersion: "v4", sort: .scheduletimeDESC, page: page) { response, error in
            if let results = response?.flights {
                self.items = results.map { flight -> AdapterItem in
                    AdapterItem(flight)
                }
            }
            self.isPageLoading = false
        }
    }
}

