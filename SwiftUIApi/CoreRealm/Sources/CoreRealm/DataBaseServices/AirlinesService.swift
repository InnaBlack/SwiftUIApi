//
//  AirlinesService.swift
//  SwiftUIApi
//
//  Created by  inna on 15/03/2021.
//

import Foundation
import RealmSwift


protocol AirlinesServiceInput {
    func readContacts(with filter: String?) -> Results<Airline>
    
    func readContact(with identifier: String) -> Airline?
    
    func writeContacts(from data: Data)
}


class AirlinesService {
    private var readRealm: Realm!
    
    let databaseService: DataBaseService
    
    init(databaseService: DataBaseService){
        readRealm = databaseService.readRealm
        
        self.databaseService = databaseService
    }
}

extension AirlinesService: AirlinesServiceInput {
    func readContacts(with filter: String?) -> Results<Airline>{
        if let filterString = filter, !filterString.isEmpty
        {
            return readRealm.objects(Airline.self)
                .filter("name CONTAINS[c] %@ OR phoneNumber CONTAINS[c] %@", filterString, filterString)
                .sorted(byKeyPath: Airline.CodingKeys.name.rawValue, ascending: true)
        }
        else
        {
            return readRealm.objects(Airline.self)
                .sorted(byKeyPath: Airline.CodingKeys.name.rawValue, ascending: true)
        }
    }
    
    func readContact(with identifier: String) -> Airline?{
        return readRealm.object(ofType: Airline.self, forPrimaryKey: identifier)
    }
    
    func writeContacts(from data: Data){
        DispatchQueue.global().async {
            autoreleasepool{
                [weak self] in
                
                guard let self = self else {return}
                
                let writeRealm = self.databaseService.newRealm
                do
                {
                    try writeRealm.write
                    {
                        do
                        {
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
                            let contacts = try decoder.decode([Airline].self, from: data)
                            writeRealm.add(contacts, update: .all)
                        }
                        catch
                        {
                            print(error)
                        }
                    }
                }
                catch
                {
                    print(error)
                }
            }
        }
    }
}
