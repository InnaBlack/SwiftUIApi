//
//  ListScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI
import UIComponents

struct AirportListScreen: View {
    
    @Binding var rouwDetailFiltered: Bool
    
    var body: some View {
        
        NavControllerView(transition: .custom(.moveAndFade)) {
            AirportScreenContent()
        }
    }
}
