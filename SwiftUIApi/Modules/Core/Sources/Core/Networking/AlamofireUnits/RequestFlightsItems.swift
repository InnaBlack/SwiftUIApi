//
//  RequestItems.swift
//  SwiftUIApi
//
//  Created by  inna on 20/01/2021.
//

import Foundation
import Alamofire

enum RequestFlightsItemsType {
    
    // MARK: 
    
    case airlines
    case airports
    case flights
    
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestFlightsItemsType: EndPointType {
   
    var version: String {
        return "/v0_1"
    }
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
       return "https://api.schiphol.nl/public-flights/"
    }

    var path: String {
        switch self {
        case .airlines:
            return "airlines"
        case .airports:
            return "destinations?page=0"
        case .flights:
            return "flights"
        }
    }
    
    var httpMethod: HTTPMethod {
            return .get
    }
    
    var headers: HTTPHeaders? {
           return [ "Accept" : "application/json",
                    "app_id" : "d51e7d9d",
                    "app_key": "7b2e061cde3bcbaa8831e4fb8bb777d6",
                    "ResourceVersion": "v4"]
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
