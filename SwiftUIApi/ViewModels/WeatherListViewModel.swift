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
        
        
//        let weatherApi: WeatherNetworkServices = ServiceLocator.shared.getService()
//        weatherApi
//      
//            self.weather.map { value ->  AdapterItem in
//            AdapterItem(value)
//        }
//        
////        WeatherForecastAPI.visualCrossingWebServicesRestServicesWeatherdataForecastGet(
//            locations: location,
//            aggregateHours: "24",
//            contentType: "json",
//            unitGroup: "us",
//            key: "A3PX775FQJLZHZFFTRATBDZQ4") { response, error in
//
//            if let resultLocation = response?.locations {
//                if let weather = resultLocation.values.first?.values {
//                    self.items = weather.map { value ->  AdapterItem in
//                        AdapterItem(value)
//
//                    }
//                }
//
//            }
//            self.isPageLoading = false
//        }
    }
}

