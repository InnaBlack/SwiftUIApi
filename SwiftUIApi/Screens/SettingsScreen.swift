//
//  SettingsScreen.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        Button(action: {
            showModal = true
        }) {
            Text("Tips")
        }.sheet(isPresented: $showModal) {
            HStack(alignment: .bottom, spacing: 20) {
                Button("Ok") {
                    self.showModal.toggle()
                }.padding(.top, 10)
            }
            Divider()
            Spacer()
            Text("""
                 ☞ Tips for before you arrive
                 1. Know where the airport is
                 2. Screenshot your boarding pass
                 3. Always print out your boarding pass
                 """)
                .font(Font.system(size: 23))
            Spacer()
        }
    }
}
