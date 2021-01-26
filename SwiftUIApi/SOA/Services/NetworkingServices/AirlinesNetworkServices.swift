//
//  AirlinesNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 22/01/2021.
//

import Foundation

class AirlinesNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private let airlines: AirlineList
    
    // MARK: - Public methods
   
    
    func getAirlines(handler: @escaping (_ weather: AirlineList?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.airlines
        ) { (weather: AirlineList?, message: AlertMessage?) in
            if let airlines = airlines {
                self.airlines = airlines
                handler(airlines, nil)
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

