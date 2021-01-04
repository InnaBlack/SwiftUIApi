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
      
        AirlineAPI.geAtairlines(accept: "application/json", appId: "d51e7d9d", appKey: "7b2e061cde3bcbaa8831e4fb8bb777d6", resourceVersion: "v4", sort: .publicnameASC, page: page) { response, error in
            if let results = response?.airlines {
                self.items = results.map { airline ->  AdapterItem in
                    AdapterItem(airline)
                }
            }
            self.isPageLoading = false
        }
    }
}

