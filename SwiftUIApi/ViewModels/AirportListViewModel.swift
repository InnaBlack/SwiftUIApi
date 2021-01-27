//
//  AirportListViewModel.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import Core

extension Destination: Identifiable {
    public var id: String {
        iata ?? "id"
    }
}


final class AirpotListViewModel: ListViewModel, ObservableObject {
    
    
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
        guard let airportApi: AirportsNetworkServices = locator.getService() else {
            fatalError()
        }
        airportApi.getAirports(page: page) { (airport, errorMessage)
            in
            if let results = airport?.destinations {
               self.items = results.map { destination -> AdapterItem in
                AdapterItem(destination) }
            }
        }
        self.isPageLoading = false
    }
}
