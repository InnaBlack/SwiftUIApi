//
//  ParameterEncoding.swift
//  SwiftUIApi
//
//  Created by  inna on 20/01/2021.
//

import Alamofire
import Foundation

extension String: ParameterEncoding {
    
    // MARK: - Public Methods
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}

