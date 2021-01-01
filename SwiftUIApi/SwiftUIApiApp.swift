//
//  SwiftUIApiApp.swift
//  SwiftUIApi
//
//  Created by  inna on 29/12/2020.
//

import SwiftUI

@main
struct SwiftUIApiApp: App {
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(AirportListViewModel())
        }
    }
}
