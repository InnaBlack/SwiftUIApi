//
//  ListScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct ListScreen: View {
    
     @EnvironmentObject var airlineViewModel: AirlineListViewModel
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ListView(viewModel: airlineViewModel, sectionName: "Airlines", geometry: geometry)
                    }
                }
            }
        }.onAppear(){
            airlineViewModel.loadPage()
        }
    }
}
