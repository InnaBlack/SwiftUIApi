//
//  File.swift
//  SwiftUICombineApp
//
//  Created by  inna on 15/12/2020.
//

// Model

import SwiftUI

struct ScreenStack {
    
    private var _screens = [Screen]()
    
    func top() -> Screen? {
        _screens.last
    }
    
    mutating func push(_ s: Screen) {
        _screens.append(s)
    }
    
    mutating func popToPrevious() {
        _ = _screens.popLast()
    }
    
    mutating func popToRoot() {
        _screens.removeAll()
    }
    
}


