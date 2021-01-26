//
//  AirportNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 22/01/2021.
//

import Foundation

class AirportsNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private let airport: DestinationList
    
    // MARK: - Public methods
   
    
    func getAirports(handler: @escaping (_ weather: DestinationList?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.airports) { (weather: DestinationList?, message: AlertMessage?) in
            if let airport = airport {
                self.airport = airport
                handler(airport, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    
    // MARK: - Initialization
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

