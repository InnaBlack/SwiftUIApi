//
// DestinationList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct DestinationList: Codable { 


    public var title: String?
    public var results: [Destination]?

    public init(title: String?, results: [Destination]?) {
        self.title = title
        self.results = results
    }

}
