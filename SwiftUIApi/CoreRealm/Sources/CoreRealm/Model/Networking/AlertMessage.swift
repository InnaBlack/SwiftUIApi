//
//  File.swift
//  
//
//  Created by  inna on 25/01/2021.
//

import Foundation

public class AlertMessage {
    
    // MARK: - Vars & Lets
    
    var title = ""
    var body = ""
    
    // MARK: - Intialization
    
   public init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}

