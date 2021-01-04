//
//  AirportListViewModel.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import Networking

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
      
        DestinationAPI.getDestinations(accept: "application/json", appId: "d51e7d9d", appKey: "7b2e061cde3bcbaa8831e4fb8bb777d6", resourceVersion: "v4", sort: .publicnameDutchASC, page: page) { response, error in
            if let results = response?.destinations {
                self.items = results.map { destination -> AdapterItem in
                    AdapterItem(destination)
                }
            }
           
            self.isPageLoading = false
        }
    }
}
