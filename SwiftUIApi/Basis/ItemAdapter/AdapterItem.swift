//
//  AdapterItem.swift
//  SwiftUIApi
//
//  Created by  inna on 04/01/2021.
//

import Networking


public struct AdapterItem: ItemTargetProtocol {

    public var id: String?
    public var publicName: String?
    public var item: Codable?

    init(_ item: Destination) {
        self.id = item.id
        self.publicName = item.publicName?.english
        self.item = item
    }

    init(_ item: Flight) {
        self.id = item.id
        self.publicName = item.aircraftRegistration
        self.item = item
    }

    init(_ item: Airline) {
        self.id = item.id
        self.publicName = item.publicName
        self.item = item
    }
    
    public init(id: String?, publicName: String?, item: Codable) {
        self.id = id
        self.publicName = publicName
        self.item = item
    }
}

