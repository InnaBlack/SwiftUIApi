//
//  FlightsListViewModels.swift
//  SwiftUIApi
//
//  Created by  inna on 02/01/2021.
//

import SwiftUI
import Core

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
        let locator = ServiceLocator.shared
        guard let flightsApi: FlightsNetworkServices = locator.getService() else {
            fatalError()
        }
        flightsApi.getFlights(page: page) { (flights, errorMessage)
            in
            if let results = flights?.flights {
               self.items = results.map { destination -> AdapterItem in
                AdapterItem(destination) }
            }
        }
        self.isPageLoading = false
    }
}
