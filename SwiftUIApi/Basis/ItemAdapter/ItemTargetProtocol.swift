//
//  ItemTarget.swift
//  SwiftUIApi
//
//  Created by  inna on 02/01/2021.
//

import SwiftUI

protocol ItemTargetProtocol: Identifiable  {
    var id: String? { get }
    var publicName: String? { get }
    var item: Codable? { get }
}

