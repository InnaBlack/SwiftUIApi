//
//  WeatherScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct WeatherScreen: View {

    var body: some View {
        
        VStack {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
            }
            Divider()
            Spacer()
     
        }
    }
}
