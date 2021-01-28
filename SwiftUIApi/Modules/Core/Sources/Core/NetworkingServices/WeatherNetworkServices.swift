//
//  UserNetworkServices.swift
//  SwiftUIApi
//
//  Created by  inna on 20/01/2021.
//

import Foundation

public class WeatherNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private var weather: WeatherDestination?
    
    // MARK: - Public methods
   
    
    public func getWeather(page: Int, location: String, handler: @escaping (_ weather: WeatherDestination?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestWeatherItemsType.forecast) { (weather: WeatherDestination?, message: AlertMessage?) in
            if let weather = weather {
                self.weather = weather
                handler(weather, nil)
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

