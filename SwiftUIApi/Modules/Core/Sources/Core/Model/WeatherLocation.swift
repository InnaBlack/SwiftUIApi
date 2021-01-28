//
//  File.swift
//  
//
//  Created by  inna on 06/01/2021.
//
import Foundation



public struct WeatherLocation: Codable {
    
    public var values: [Weather]?
    
    public init(values: [Weather]?) {
        self.values = values
    }
}
