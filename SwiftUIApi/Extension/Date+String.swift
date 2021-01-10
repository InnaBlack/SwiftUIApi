//
//  Date+String.swift
//  SwiftUIApi
//
//  Created by  inna on 07/01/2021.
//

import Foundation

extension Date {
    static func getFormattedDate(stringDate: String , formatter:String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        let date: Date? = dateFormatterGet.date(from: stringDate)
        return dateFormatterPrint.string(from: date ?? Date())
    }
}

