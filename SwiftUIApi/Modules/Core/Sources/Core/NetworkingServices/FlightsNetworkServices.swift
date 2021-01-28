//
//  FlightsNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 22/01/2021.
//

import Foundation

public class FlightsNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private var flights: FlightList?
    
    // MARK: - Public methods
   
    
    public func getFlights(page: Int,  handler: @escaping (_ flights: FlightList?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestFlightsItemsType.flights) { (flights: FlightList?, message: AlertMessage?) in
            if let flights = flights {
                self.flights = flights
                handler(flights, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    
    // MARK: - Initialization
    
    public init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}
