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
        VStack(alignment: .center) {
            HStack {
                Text(sectionName).frame(width: geometry.size.width/2).background(Color.gray)
                Text(String(viewModel.page)).frame(width: geometry.size.width/2).background(Color.gray)
            }
            List {
                ForEach(viewModel.items) { item in
                    if let publicName = item.publicName  {
                        NavPushButton(destination: CellView(item: item, viewModel: viewModel)) {
                            Text(verbatim:publicName).onAppear() {
                                if viewModel.items.isLast(item) {
                                    viewModel.loadPage()
                                }
                            }
                        }
                    }
                }
                Section {
                    if viewModel.isPageLoading {
                        VStack (alignment: .center) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }.frame(width: geometry.size.width - 5, height: geometry.size.height - 55, alignment: .center)//List1
            
        }
    }
}
