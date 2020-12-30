//
//  File.swift
//  SwiftUICombineApp
//
//  Created by  inna on 16/12/2020.
//

import SwiftUI

public struct NavPopButton<Label>: View where Label: View {
    
    @EnvironmentObject var viewModel: NavControllerViewModel
    
    private let destination: PopDestination
    private let label: () -> Label
    
    public init(destination: PopDestination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        label().onTapGesture {
            push()
        }
    }
    
    private func push() {
        viewModel.pop(to: destination)
    }    
}
