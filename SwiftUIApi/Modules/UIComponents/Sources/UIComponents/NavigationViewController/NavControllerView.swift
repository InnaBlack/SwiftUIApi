//
//  NavControllerView.swift
//  SwiftUICombineApp
//
//  Created by  inna on 15/12/2020.
//

import SwiftUI

public struct NavControllerView<Content>: View where Content: View {
    
    @ObservedObject var viewModel: NavControllerViewModel
    
    private let _content: Content
    private let _transitions: (push: AnyTransition, pop: AnyTransition)
    
    public init(transition: NavigationTransition,
                easing: Animation = .easeOut(duration: 0.33),
                @ViewBuilder content: @escaping () -> Content) {
        
        viewModel = NavControllerViewModel(easing: easing)
        self._content = content()
        
        switch transition {
            case .custom(let trans):
                _transitions = (trans, trans)
            case .none:
                _transitions = (.identity, .identity)
        }
    }
    
    public var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                _content
                    .transition(viewModel.navigationType == .push ? _transitions.push : _transitions.pop)
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen
                    .transition(viewModel.navigationType == .push ? _transitions.push : _transitions.pop)
                    .environmentObject(viewModel)
            }
        }
    }
}
