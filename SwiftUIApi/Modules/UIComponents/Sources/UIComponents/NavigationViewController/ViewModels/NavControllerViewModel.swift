//
//  NavControllerViewModel.swift
//  SwiftUICombineApp
//
//  Created by  inna on 16/12/2020.
//

import SwiftUI

final class NavControllerViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    private var _screenStack = ScreenStack() {
        didSet {
           currentScreen = _screenStack.top()
        }
    }
    
    // for transition
    var navigationType: NavigationType = .push
    private let _easing: Animation
    
    init(easing: Animation) {
        self._easing = easing
    }
    
    func push<S: View>(_ screenView: S) {
        withAnimation(_easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            _screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(_easing) {
            navigationType = .pop
            switch to {
            case .root:
                _screenStack.popToRoot()
            case .previous:
                _screenStack.popToPrevious()
            }
        }
    }
}
