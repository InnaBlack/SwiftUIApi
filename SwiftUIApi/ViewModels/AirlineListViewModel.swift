//
//  AirlinesListViewModel.swift
//  SwiftUIApi
//
//  Created by  inna on 02/01/2021.
//

import SwiftUI
import CoreRealm
import RealmSwift


final class AirlineListViewModel: ListViewModel, ObservableObject {
     

    @Published var items: [AdapterItem] = [AdapterItem]()
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false

    
    public var id = UUID()
    
    init() {
    }
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
        //todo add page parameter
        LocatorService.current.loadService.syncIfNeed({ (error) in
            
        })

        self.items = LocatorService.current.airlinesService.readContacts(with: "").map { airline -> AdapterItem in
            AdapterItem(airline)
        }
       
        self.isPageLoading = false
    }
}
