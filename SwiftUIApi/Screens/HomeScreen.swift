//
//  HomeScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.

import SwiftUI

struct HomeScreen: View {
    
    @Binding var currentTab: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button("Maastricht") {
                currentTab = TabList.tab2.rawValue
            }
        }
    }
}
