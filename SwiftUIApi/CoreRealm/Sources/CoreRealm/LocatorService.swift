//
//  ServiceLocating.swift
//  SwiftUIApi
//
//  Created by  inna on 21/01/2021.
//

import Foundation
import UIKit
import Alamofire

 public class LocatorService {
    public static let current = LocatorService()
    
    var airlinesNetworkService: AirlinesNetworkServices!
    var dataBaseService: DataBaseService!
    
    public lazy var loadService = makeLoadService()
    public lazy var airlinesService = makeAirlinesService()
    

    public init() {
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
    
    func makeAirlinesService() -> AirlinesServiceInput {
        let service = AirlinesService(databaseService: self.dataBaseService)
        
        LogService.log(.contactsService, level: .info, message: "did create")
        
        return service
    }
    
    func makeLoadService() -> LoadServiceInput {
        
        let service = LoadService(airlineNetworkService: self.airlinesNetworkService,
                                  databaseService: self.dataBaseService,
                                  airlinesService: self.airlinesService)
        LogService.log(.loadService, level: .info, message: "did create")
        
        return service
    }
}
