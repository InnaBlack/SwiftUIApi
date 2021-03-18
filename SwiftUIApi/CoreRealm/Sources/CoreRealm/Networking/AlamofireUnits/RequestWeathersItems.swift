//
//  RequestItems.swift
//  SwiftUIApi
//
//  Created by  inna on 20/01/2021.
//

import Foundation
import Alamofire


enum RequestWeatherItemsType {
    
    // MARK:
    
    case timeline
    case forecast
    case history
    
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestWeatherItemsType: EndPointType {
    
    var version: String {
        return "/v0_1"
    }
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        return "https://weather.visualcrossing.com/"
    }
    
    var path: String {
        switch self {
        case .timeline:
            return "timeline"
        case .forecast:
            return "VisualCrossingWebServices/rest/services/weatherdata/forecast?aggregateHours=24&combinationMethod=aggregate&contentType=json&unitGroup=uk&key=A3PX775FQJLZHZFFTRATBDZQ4&dataElements=default&locations=Mijdrecht"
        case .history:
            return "history"
        }
    }
    
    var httpMethod: HTTPMethod {
            return .get
    }
    
    var headers: HTTPHeaders? {
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"]
    
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
