//
//  File.swift
//  SwiftUIApi
//
//  Created by  inna on 04/01/2021.
//

import SwiftUI

protocol ListViewModel: Identifiable {
    var items: [AdapterItem]  { get }
    var page: Int { get }
    var isPageLoading: Bool { get }
    var id: UUID { get }
    
    func loadPage()
}

