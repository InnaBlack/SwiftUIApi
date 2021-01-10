//
//  WeatherDetail.swift
//  SwiftUIApi
//
//  Created by  inna on 07/01/2021.
//

import SwiftUI
import Networking
import UIComponents


struct WeatherDetailScreen: View {
    
    var item: Weather
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            if let publicName = item.datetimeStr  {
                Text(verbatim: publicName)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            Divider()
            HStack() {
                Text(verbatim: "Temperature")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(verbatim: String(item.temp ?? 0.00))
                    .font(.headline)
                    .foregroundColor(.primary)
                
            }
            
            Divider()
            HStack() {
                Text(verbatim: "Wind")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(verbatim: String(item.wdir ?? 0.00))
                    .font(.headline)
                    .foregroundColor(.primary)
                
            }
        }
    }
}

