//
//  AirportNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 22/01/2021.
//

import Foundation

public class AirportsNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private var airport: DestinationList?
    
    // MARK: - Public methods
   
    
    public func getAirports(page: Int, handler: @escaping (_ airports: DestinationList?, _ message: AlertMessage?)->()) {
        
        //let parameters = ["page":page]
        
        self.apiManager.call(type: RequestFlightsItemsType.airports) { (airport: DestinationList?, message: AlertMessage?) in
            if let airport = airport {
                self.airport = airport
                handler(airport, nil)
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

