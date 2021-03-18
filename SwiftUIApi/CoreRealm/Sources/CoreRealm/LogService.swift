//
//  LogService.swift
//  SwiftUIApi
//
//  Created by  inna on 13/03/2021.
//

import Foundation


enum ServiceName {
    case networkService
    case databaseService
    case loadService
    case locatorService
    case contactsService
    case logService
}


enum EventLevel {
    case info
    case error
    case time
}


class LogService {
    static func log(_ service: ServiceName,level: EventLevel, message: String) {
        print("[\(service)] [\(level)] - \(message)")
    }
}

