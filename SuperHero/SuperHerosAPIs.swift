//
//  HeroAPIs.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation
import Networking

public struct SuperHeroAPI: APIHandler {
    public init() {}
    public func makeRequest(from parameters: [String: Any]) -> Request {
        // prepare url
        let url = Path.Hero().all
        var urlRequest = URLRequest(url: url!)
        // set http method type
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        // set body params
        set(parameters, urlRequest: &urlRequest)
        // prepares request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        
        return request
    }
    
    public func parseResponse(data: Data) throws -> [SuperHero]? {
        return try defaultParseResponse(data: data)
    }
}

public struct SuperHeroDetailAPI: APIHandler {
    var heroID: Int
    public init(heroID: Int) {
        self.heroID = heroID
    }
    public func makeRequest(from parameters: [String: Any]) -> Request {
        // prepare url
        let url = Path.Hero().getHero(heroID)
        var urlRequest = URLRequest(url: url!)
        // set http method type
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        // set body params
        set(parameters, urlRequest: &urlRequest)
        // prepares request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        
        return request
    }
    
    public func parseResponse(data: Data) throws -> SuperHero? {
        return try defaultParseResponse(data: data)
    }
}
