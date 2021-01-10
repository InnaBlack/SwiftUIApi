//
//  WeatherScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct WeatherScreen: View {
    
    @EnvironmentObject var weatherViewModel: WeatherListViewModel
    

    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                Divider()
                Spacer()
                HStack {
                    ListView(viewModel: weatherViewModel, sectionName: "Weather", geometry: geometry)
                }
            }.onAppear() {
                weatherViewModel.loadPage()
            }
        }
    }
}
