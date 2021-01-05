//
//  ViewModel.swift
//  SwiftUIApi
//
//  Created by  inna on 03/01/2021.
//

import SwiftUI
import UIComponents

struct ListView <T: ListViewModel>: View {
    
    var viewModel: T
    var sectionName: String
    var geometry: GeometryProxy
    
    var body: some View {
        List {
            Section.init {
                Text(sectionName).bold()
            }
            ForEach(viewModel.items) { item in
                if let publicName = item.publicName  {
                    NavPushButton(destination: CellView(item: item)) {
                        Text(verbatim:publicName).onAppear() {
                            if viewModel.items.isLast(item) {
                                viewModel.loadPage()
                            }
                        }
                    }
                }
            }
        }.frame(width: geometry.size.width - 5, height: geometry.size.height - 55, alignment: .center)//List1
    }
}
