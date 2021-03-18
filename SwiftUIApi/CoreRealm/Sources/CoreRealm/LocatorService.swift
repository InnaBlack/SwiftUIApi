//
//  ServiceLocating.swift
//  SwiftUIApi
//
//  Created by  inna on 21/01/2021.
//

import Foundation
import UIKit


class LocatorService {
    static let current = LocatorService()
    
    var airlinesNetworkService: AirlinesNetworkServices!
    var dataBaseService: DataBaseService!
    
    lazy var loadService = makeLoadService()
    lazy var airlinesService = makeAirlinesService()
    

    init() {
        initEarlyServices()
    }
    
    func initEarlyServices() {
        initNetworkService()
        initDataBaseService()
    }
}


private extension LocatorService {
    func initNetworkService() {
        let apiManager = APIManager(sessionManager: Alamofire.Session(configuration: URLSessionConfiguration.default))
            
        airlinesNetworkService = .init(apiManager: apiManager)
        LogService.log(.networkService, level: .info, message: "did create")
    }
    
    func initDataBaseService() {
        dataBaseService = DataBaseService()
        LogService.log(.databaseService, level: .info, message: "did create")
    }
    
    func makeAirlinesService() -> ContactsServiceInput {
        let service = ContactsService(databaseService: self.dataBaseService)
        
        LogService.log(.contactsService, level: .info, message: "did create")
        
        return service
    }
    
    func makeLoadService() -> LoadServiceInput {
        
        let service = LoadService(networkService: self.networkService,
                                  databaseService: self.dataBaseService,
                                  contactsService: self.contactsService)
        LogService.log(.loadService, level: .info, message: "did create")
        
        return service
    }
}
