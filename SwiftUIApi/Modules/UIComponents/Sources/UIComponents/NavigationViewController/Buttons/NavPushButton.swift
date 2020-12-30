//
//  File.swift
//  SwiftUICombineApp
//
//  Created by  inna on 16/12/2020.
//

import SwiftUI

public struct NavPushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject var viewModel: NavControllerViewModel
    
    private let destination: Destination
    private let label: () -> Label
    
    public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        label().onTapGesture {
            push()
        }
    }
    
    private func push() {
        viewModel.push(destination)
    }
    
}

