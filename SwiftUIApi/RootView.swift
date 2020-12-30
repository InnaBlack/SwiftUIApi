//
//  ContentView.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI

struct RootView: View {
    
    @State private var currentTab: Int = TabList.tab1.rawValue
    @State private var rouwDetailFiltered: Bool = false
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeScreen(currentTab: $currentTab, rouwDetailFiltered: $rouwDetailFiltered).tabItem {
                TabItemView(imageName: TabList.tab1.imageName, titleText: TabList.tab1.titleText)
            }.tag(0)
            AirportListScreen(rouwDetailFiltered: $rouwDetailFiltered).tabItem {
                TabItemView(imageName: TabList.tab2.imageName, titleText: TabList.tab2.titleText)
            }.tag(1)
            SettingsScreen().tabItem {
                TabItemView(imageName: TabList.tab3.imageName, titleText: TabList.tab3.titleText)
            }.tag(2)
        }//Tabview
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView()
        }
    }
}
