//
//  AirlinesListViewModel.swift
//  SwiftUIApi
//
//  Created by  inna on 02/01/2021.
//

import SwiftUI
import Networking

extension Airline: Identifiable {
    public var id: String {
        iata ?? "id"
    }
}

final class AirlineListViewModel: ObservableObject {
    
    @Published private(set) var items: [Airline] = [Airline]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    init() {}
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
      
        AirlineAPI.geAtairlines(accept: "application/json", appId: "d51e7d9d", appKey: "7b2e061cde3bcbaa8831e4fb8bb777d6", resourceVersion: "v4", sort: .publicnameASC, page: page) { response, error in
            if let results = response?.airlines {
                self.items.append(contentsOf: results)
            }
            self.isPageLoading = false
        }
    }
}

