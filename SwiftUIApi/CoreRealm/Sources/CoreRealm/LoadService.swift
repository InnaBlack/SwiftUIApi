//
//  LoadService.swift
//  SwiftUIApi
//
//  Created by  inna on 13/03/2021.
//

import RealmSwift


typealias simpleHandler = (_ error: Error?) -> Void


protocol LoadServiceInput {
    func sync(_ completion: simpleHandler?)
    func syncIfNeed(_ completion: simpleHandler?)
}


class LoadService {
    let syncInterval: TimeInterval = 60 // in seconds
    let lastLoadDateKey = "LastLoadDateKey"
    
    private let airlineNetworkService: AirlinesNetworkServices
    private let databaseService: DataBaseService
    private let airlineService: AirlinesServiceInput
    
    private var lastLoadDate: Date {
        get
        {
            let value = UserDefaults().value(forKey: lastLoadDateKey)
            return  value as? Date ?? Date.distantPast
        }
        
        set
        {
            UserDefaults().set(newValue, forKey: lastLoadDateKey)
        }
    }
    
    init(networkService: AirlinesNetworkServices,
         databaseService: DataBaseService,
         contactsService: AirlinesServiceInput) {
        self.networkService = networkService
        self.databaseService = databaseService
        self.contactsService = contactsService
    }
}

extension LoadService: LoadServiceInput {
    func syncIfNeed(_ completion: simpleHandler?) {
        let lastLoadDateTimeIntervalSinseNow = Date().timeIntervalSince(lastLoadDate)
        
        if lastLoadDateTimeIntervalSinseNow > syncInterval
        {
            sync(completion)
        }
        else if let syncCompletion = completion
        {
            let error = NSError(code: 200, message: "Already updated")
            
            syncCompletion(error)
        }
    }
    
    func sync(_ completion: simpleHandler?) {
        var syncErrors = [Error]()
        var date = Date()
        LogService.log(.loadService, level: .time, message: "Start \(date)")
        
        let syncQueue = OperationQueue()
        
        var waitResult: DispatchTimeoutResult = .timedOut
        
        let requestOperation = BlockOperation
        {
            let resourceNames = self.resourceNames
            
            let requestsGroup = DispatchGroup()
            
            LogService.log(.loadService, level: .time, message: "Start loading resources \(date.timeIntervalSinceNow) s")
            date = Date()
            
            for i in 1...3
            {
                requestsGroup.enter()
                                
                self.airlineNetworkService.getAirlines(page: page) { [weak self] (airlines, errorMessage)
                    in
                    if let someData = resultData, someData.count > 0
                    {
                        self?..writeContacts(from: someData)
                    }
                    
                    if let syncError = error
                    {
                        syncErrors.append(syncError)
                    }
                    requestsGroup.leave()
                }
            }
            
            //            requestsGroup.wait()
            waitResult = requestsGroup.wait(timeout: .now() + 30)
            
            LogService.log(.loadService, level: .time, message: "End loading resources \(date.timeIntervalSinceNow) s")
            date = Date()
        }
        
        let responseOperation = BlockOperation
        {[weak self] in
            
            DispatchQueue.main.async
                {
                    date = Date()
                    if waitResult == .success
                    {
                        self?.lastLoadDate = Date()
                    }
                    else
                    {
                        let error = NSError(code: 502, message: "Connection error")
                        
                        syncErrors.append(error)
                    }
                    
                    if let syncCompletion = completion
                    {
                        if syncErrors.isEmpty
                        {
                            syncCompletion(nil)
                        }
                        else
                        {
                            for error in syncErrors
                            {
                                syncCompletion(error)
                            }
                        }
                    }
            }
        }
        
        responseOperation.addDependency(requestOperation)
        
        
        syncQueue.addOperation(requestOperation)
        syncQueue.addOperation(responseOperation)
    }
}

