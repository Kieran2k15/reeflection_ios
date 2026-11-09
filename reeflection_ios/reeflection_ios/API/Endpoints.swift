//
//  RFAPIEndpoints.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import Foundation

struct RFEndpoints {
    
    static let api = "https://api.rktube.io"
    static let origin = "https://dive.rktube.io"
    static let baseURL = URL(string: RFEndpoints.api)!
    
    static let demoEndpoint = "auth/demo"
    static let userEndpoint = "auth/me"
    static let divesEndpoint = "dive/dives"
    
    static let demoURL = RFEndpoints.baseURL.appending(path: demoEndpoint)
    
    static func demoRequest() -> URLRequest {
        
        var request = URLRequest(url: RFEndpoints.demoURL)
        request.httpMethod = "POST"
        request.setValue(RFEndpoints.origin, forHTTPHeaderField: "Origin")
        
        return request
    }
    
    static func userRequest() -> URLRequest {
        return URLRequest(url: RFEndpoints.baseURL.appending(path: RFEndpoints.userEndpoint))
    }
    
    static func divesRequest(id: String?) -> URLRequest {
        
        guard let id = id else {
            return URLRequest(url: RFEndpoints.baseURL.appending(path: RFEndpoints.divesEndpoint))
        }
        
        let path = RFEndpoints.divesEndpoint + "/" + id
        
        return URLRequest(url: RFEndpoints.baseURL.appending(path: path))
    }
}
