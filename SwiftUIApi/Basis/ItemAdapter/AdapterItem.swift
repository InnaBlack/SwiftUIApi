//
//  AdapterItem.swift
//  SwiftUIApi
//
//  Created by  inna on 04/01/2021.
//

import Foundation
import CoreRealm

public struct AdapterItem: ItemTargetProtocol  {
    
    public var id: String?
    public var publicName: String?
    public var item: Codable?
    
    init(_ item: Airline) {
        self.id = item.iata
        self.publicName = item.iata
        self.item = item
    }
    public init(id: String?, publicName: String?, item: Codable) {
        self.id = id
        self.publicName = publicName
        self.item = item
    }
}

