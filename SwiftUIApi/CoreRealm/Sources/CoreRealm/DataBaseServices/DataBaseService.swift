//
//  DataBaseService.swift
//  SwiftUIApi
//
//  Created by  inna on 13/03/2021.
//

import Foundation
import RealmSwift
import Realm


class DataBaseService {
    var readRealm: Realm!
    var newRealm: Realm {
        let configuration = self.makeAirlineConfiguration(readOnly: false)
        return try! Realm(configuration: configuration)
    }
    
    init() {
        let configuration = self.makeAirlineConfiguration(readOnly: false)
        self.readRealm = try! Realm(configuration: configuration)
    }
}


private extension DataBaseService {
    func makeAirlineConfiguration(readOnly: Bool) -> Realm.Configuration {
        let config = Realm.Configuration(
            fileURL: contactsFileUrl(),
            schemaVersion: 4)
        return config
    }
    
    func contactsFileUrl() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return directory.appendingPathComponent("airlines.realm")
    }
}
