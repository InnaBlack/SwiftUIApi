//
//  String+Float.swift
//  SwiftUICombineApp
//
//  Created by  inna on 02/12/2020.
//

import Foundation

extension Float {
    func toString() -> String {
        return String(format: "%2.4f", arguments: [self])
    }
}
