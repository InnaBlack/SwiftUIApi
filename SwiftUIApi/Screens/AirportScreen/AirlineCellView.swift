//
//  AirportScreenContent.swift
//  SwiftUICombineApp
//
//  Created by  inna on 17/12/2020.
//

import SwiftUI
import Networking
import UIComponents

struct AirlineCellView: View {
    
    @EnvironmentObject var airportViewModel: AirportListViewModel
    
    let item: Destination
    
    var body: some View {
        VStack(alignment: .leading) {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left.circle.fill")
            }
            if let publicName = item.publicName  {
            Text(verbatim: publicName.english.asStringOrEmpty)
                .font(.headline)
                .foregroundColor(.primary)
            if airportViewModel.isPageLoading && airportViewModel.items.isLast(item) {
                Divider()
                VStack (alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(maxWidth: .infinity)
            }}
        } // VStack
    }
}

