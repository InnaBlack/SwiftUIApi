//
//  FlightsNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 22/01/2021.
//

import Foundation

class FlightsNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private let flights: FlightList
    
    // MARK: - Public methods
   
    
    func getFlights(handler: @escaping (_ weather: FlightList?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.flights) { (weather: FlightList?, message: AlertMessage?) in
            if let flights = flights {
                self.flights = flights
                handler(flights, nil)
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
