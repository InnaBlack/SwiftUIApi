//
// Weather.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Weather: Codable { 


    public var wdir: Double?
    public var temp: Double?
    public var datetimeStr: String?

    public init(wdir: Double?, temp: Double?, datetimeStr: String?) {
        self.wdir = wdir
        self.temp = temp
        self.datetimeStr = datetimeStr
    }
}
