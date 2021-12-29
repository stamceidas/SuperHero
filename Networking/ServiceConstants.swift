//
//  ServiceConstants.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

enum Environment {
    
    case development
    
    func baseURL() -> String {
        return "\(urlProtocol())://\(domain())/\(route())"
    }
    
    func urlProtocol() -> String {
        switch self {
        case .development:
            return "https"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "cdn.jsdelivr.net"
        }
    }
    
    func route() -> String {
        return "gh/akabab/superhero-api@0.3.0/api"
    }
    
}

extension Environment {
    func host() -> String {
        return "\(self.domain())"
    }
}


// MARK:- APIs
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.development
#endif

let baseUrl = environment.baseURL()

public struct Path {
    
    public struct Hero {
        public init() {}
        
        public var all: String { return "\(baseUrl)/all.json" }
        
        public var getHero: (Int) -> String = { heroID in
            return "\(baseUrl)/id/\(String(heroID)).json"
        }
    }
}
