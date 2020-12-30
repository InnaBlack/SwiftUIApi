//
//  Screen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 15/12/2020.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
    
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}
