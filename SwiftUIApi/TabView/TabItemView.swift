//
//  TabItemView.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import SwiftUI

struct TabItemView: View {
    let imageName: String
    let titleText: String
    
    var body: some View {
        VStack(spacing:0) {
            Image(systemName: imageName)
            Text(titleText)
        }
    }
}
