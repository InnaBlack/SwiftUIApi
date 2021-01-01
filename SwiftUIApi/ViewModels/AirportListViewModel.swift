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

final class AirportListViewModel: ObservableObject {
    
    @Published private(set) var items: [Destination] = [Destination]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    init() {}
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
      
        DestinationsAPI.getDestinations(appId: "d51e7d9d", appKey: "7b2e061cde3bcbaa8831e4fb8bb777d6", resourceVersion: "v4", sort: .publicnameDutchASC, page: page) { response, error in
            if let results = response?.destinations {
                self.items.append(contentsOf: results)
            }
            self.isPageLoading = false
        }
    }
}
