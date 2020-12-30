//
//  File.swift
//  SwiftUICombineApp
//
//  Created by  inna on 15/12/2020.
//

import SwiftUI

// Navigation type
public enum NavigationType {
    case push
    case pop
}

//Effect pop
public enum PopDestination {
    case previous
    case root
}

public enum NavigationTransition {
    case none
    case custom(AnyTransition)
}
