//
//  TabList.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import Foundation

enum TabList: Int, CaseIterable {
    
    case tab1 = 0
    case tab2
    case tab3
    
    var titleText: String {
        switch self {
        case .tab1:
            return "Home"
        case .tab2:
            return "List"
        case .tab3:
            return "Settings"
        }
    }
    
    var imageName: String {
        switch self {
        case .tab1:
            return "house.fill"
        case .tab2:
            return "list.bullet"
        case .tab3:
            return "gear"
        }
    }
}
