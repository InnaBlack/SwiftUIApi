//
//  AirlinesListViewModel.swift
//  SwiftUIApi
//
//  Created by  inna on 02/01/2021.
//

import SwiftUI
import Core

extension Airline: Identifiable {
    public var id: String {
        iata ?? "id"
    }
}

final class AirlineListViewModel: ListViewModel, ObservableObject {
     

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
        guard let airlinesApi: AirlinesNetworkServices = locator.getService() else {
            fatalError()
        }
        airlinesApi.getAirlines(page: page) { (airlines, errorMessage)
            in
            if let results = airlines?.airlines {
               self.items = results.map { destination -> AdapterItem in
                AdapterItem(destination) }
            }
        }
        self.isPageLoading = false
    }
}
