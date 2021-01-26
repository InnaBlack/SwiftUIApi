//
//  UserNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 20/01/2021.
//

import Foundation

class WeatherNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private let weather: WeatherDestination
    
    // MARK: - Public methods
   
    
    func getWeather(handler: @escaping (_ weather: WeatherDestination?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.history) { (weather: WeatherDestination?, message: AlertMessage?) in
            if let weather = weather {
                self.weather = weather
                handler(weather, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    
    // MARK: - Initialization
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
        self.apiManager.networkEnviroment = .flights
    }
}

