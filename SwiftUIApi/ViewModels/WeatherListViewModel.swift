//
//  WeatherListViewModel.swift
//  SwiftUIApi
//
//  Created by  inna on 05/01/2021.
//


import SwiftUI
import Core

extension Weather: Identifiable {
    public var id: String {
        datetimeStr ?? "id"
    }
}

final class WeatherListViewModel: ListViewModel,  ObservableObject {
    
    
    @Published var items: [AdapterItem] = [AdapterItem]()
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false
    var location: String
    public var id = UUID()
    
    init(location: String) {
        self.location = location
    }
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
        let locator = ServiceLocator.shared
        guard let weaterApi: WeatherNetworkServices = locator.getService() else {
            fatalError()
        }
        weaterApi.getWeather(page: page, location:  self.location) { (weather, errorMessage)
            in
            if let resultLocation = weather?.locations {
                if let weather = resultLocation.values.first?.values {
                    self.items = weather.map { value ->  AdapterItem in
                        AdapterItem(value)
                        
                    }
                }
               
            }
        }
        self.isPageLoading = false
    }
}
