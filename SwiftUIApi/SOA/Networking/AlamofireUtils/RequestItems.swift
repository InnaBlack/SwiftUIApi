//
//  RequestItems.swift
//  SwiftUIApi
//
//  Created by  inna on 20/01/2021.
//

import Alamofire

// MARK: - Enums

enum NetworkEnvironment {
    case dev
    case production
    case stage
}

enum RequestItemsType {
    
    // MARK: Weather
    
    case timeline
    case forecast
    case history
    case airlines
    case airports
    case flights
    
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
            case .weather: return "https://https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast"
            case .flights: return "https://api.schiphol.nl/public-flights/"
        }
    }
    
    var version: String {
        return "/v0_1"
    }
    
    var path: String {
        switch self {
        case .timeline:
            return "timeline"
        case .forecast:
            return "forecast"
        case .history:
            return "history"
        case .airlines:
            return "airlines"
        case .airports:
            return "destinations"
        case .flights:
            return "flights"
        }
    }
    
    var httpMethod: HTTPMethod {
            return .get
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}
