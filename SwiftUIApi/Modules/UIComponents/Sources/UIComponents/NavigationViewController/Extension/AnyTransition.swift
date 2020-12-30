//
//  File.swift
//  
//
//  Created by  inna on 17/12/2020.
//

import SwiftUI

extension AnyTransition {
    
    public static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
}
