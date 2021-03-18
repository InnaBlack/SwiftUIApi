//
//  AirlinesNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 22/01/2021.
//

import Foundation
import RealmSwift

class AirlinesNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private var airlines: AirlineList?
    
    // MARK: - Public methods
   
    
    public func getAirlines(page: Int, handler: @escaping (_ airlines: AirlineList?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestFlightsItemsType.airlines
        ) { (airlines: AirlineList?, message: AlertMessage?) in
            if let airlines = airlines{
                self.airlines = airlines
                handler(airlines, nil)
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

