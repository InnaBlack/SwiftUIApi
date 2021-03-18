//
//  Endpoints.swift
//  SwiftUIApi
//
//  Created by  inna on 20/01/2021.
//

import Alamofire
import Foundation

protocol EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
    
}

